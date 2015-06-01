class Admin::Lb::OrdersController < Admin::BaseController
  def index
    @orders = ::Lb::Order.page params[:page]
  end
end
