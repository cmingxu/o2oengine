class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_cart

  def load_cart
    @cart = Cart.load(cookies)
  end

  
  def set_wechat_js_config(wechat_api)
    @config = {
      :jsapi_ticket => wechat_api.js_ticket,
      :noncestr  => SecureRandom.hex(10),
      :timestamp => Time.now.to_i,
      :url => request.url
    }
    @config[:signature] = Digest::SHA1.hexdigest(@config.keys.sort.map{|k| "#{k}=#{@config[k]}" }.join("&"))
  end


end
