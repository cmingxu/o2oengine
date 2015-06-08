class Wechat::BaseController < ApplicationController
  layout "wechat"

  before_filter :login_required, :except => [:login_from_wechat, :notify, :news]
  helper_method :current_user

 skip_before_filter :verify_authenticity_token, :only => :notify
  

  before_filter  :only => [:index] do
    set_wechat_js_config $wechat_api
  end

  def current_user
    User.find_by_id session[:user_id]
  end

  def index
    @lb_products = Lb::Product.all.order("position")
  end

  def news
  end

  def login_from_wechat
    if user = User.login_from_wechat(request.env["omniauth.auth"], :user)
      session[:user_id] = user.id
      redirect_to wechat_path and return
    end
  end

  def login_required
    if !Rails.env.production?
      session[:user_id] = User.first.id
      return true
    end

    if current_user.nil?
      redirect_to "/auth/wechat" and return
      return false
    end
  end

  def notify
    result = Hash.from_xml(request.body.read)["xml"]
    Rails.logger.debug result
    if result['result_code'] == result['return_code'] && result['return_code'] == 'SUCCESS'#WxPay::Sign.verify?(result)
      @order = Lb::Order.find_by_order_num(result["order_num"])
      @order.transaction_id = result['transaction_id']
      @order.bank_type      = result['bank_type']
      @order.paid_at        = Time.now
      @order.pay! if @order.not_paid?
      render :xml => {return_code: "SUCCESS"}.to_xml(root: 'xml', dasherize: false)
    else
      render :xml => {return_code: "SUCCESS", return_msg: "签名失败"}.to_xml(root: 'xml', dasherize: false)
    end
  end


  def change_product
    current_user.update_column :last_product_id, params[:product_id]
    current_user.reload
  end

  def change_address
    current_user.update_column :address, params[:address]
    current_user.update_column :phone, params[:phone]
    current_user.reload
  end

  def change_last_quantity
    last_quantity = (current_user.last_quantity || 0) + params[:change].to_i
    last_quantity = 1 if last_quantity < 1
    current_user.update_column :last_quantity, last_quantity
    current_user.reload
  end

  def place_order
    @pay_config = {
      :signType => "MD5",
      :timeStamp => Time.now.to_i,
      :appId => Wechat.config.appid,
      :nonceStr  => SecureRandom.hex(10)
    }

    @order = Lb::Order.create do |o|
      o.order_num = "%06d" % Lb::Order.count
      o.status = 'not_paid'
      o.product_id = current_user.last_product_id
      o.spbill_create_ip = request.headers["X-Real-IP"]
      o.quantity = current_user.last_quantity
      o.price = current_user.calculated_price * 100
      o.notify_url = "http://shui.6luobo.com/wechat/notify?order_num=#{o.order_num}"
      o.user = current_user
      o.body = "#{o.lb_product.name}X#{o.quantity}"
      o.give_for_free = (o.price % 100) == 1
    end
    Rails.logger.debug @order.prepay_params
    @r = WxPay::Service.invoke_unifiedorder(@order.prepay_params)
    Rails.logger.debug @r
    if @r.success?
      @order.update_column :prepay_id, @r['prepay_id']
      @pay_config[:package] = "prepay_id=#{@r['prepay_id']}"
      @pay_config[:paySign] = WxPay::Sign.generate(@pay_config)
    end
  end

  def order_confirm
  end

  def orders
    @order = current_user.last_processing_order
  end

  def failure
    Rails.logger.error params[:message]
    head 404
  end
end
