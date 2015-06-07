class Admin::Lb::OrdersController < Admin::BaseController
  def index
    if params[:status]
      @orders = ::Lb::Order.where(:status => params[:status]).page params[:page]
    else
      @orders = ::Lb::Order.page params[:page]
    end
  end

  def edit
    @order = ::Lb::Order.find params[:id]
    render layout: false
  end

  def update
    @order = ::Lb::Order.find params[:id]
    @order.update_attributes order_params
    @order.save
    @order.deliver!

    redirect_to :back
  end

  def done_deliver
    @order = ::Lb::Order.find params[:id]
    @order.close!

    redirect_to :back
  end

  def order_params
    params.require(:lb_order).permit(:staff_id)
  end
end
