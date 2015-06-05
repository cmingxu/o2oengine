class Wechat::BaseController < ApplicationController
  layout "wechat"

  before_filter :login_required, :except => [:login_from_wechat]
  helper_method :current_user

  def current_user
    User.find_by_id session[:user_id]
  end

  def index
    @lb_products = Lb::Product.all
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
      redirect_to "/auth/wechat_user" and return
      return false
    end
  end

  def notify
    result = Hash.from_xml(request.body.read)["xml"]
    if result['result_code'] == result['return_code'] && result['return_code'] == 'SUCCESS'#WxPay::Sign.verify?(result)
      @order = Order.find_by_order_num(result["order_num"])
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

  def order_confirm
  end
end
