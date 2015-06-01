class Admin::Lb::ProductsController < Admin::BaseController
  include PositionMover
  before_filter :find_product, :only => [:show, :edit, :update, :destroy, :move_higher, :move_lower]

  def index
    @products = ::Lb::Product.page params[:page]
  end

  def new
    @lb_product = ::Lb::Product.new 
    render layout: false
  end

  def create
    @lb_product = ::Lb::Product.new lb_product_param
    if @lb_product.save
      redirect_to admin_lb_products_path
    else
      render :new
    end
  end

  def edit
    render layout: false
  end

  def update
    @lb_product.update_attributes lb_product_param
    if @lb_product.save
      redirect_to admin_lb_products_path
    else
      render :edit
    end
  end

  private
  def find_product
    @lb_product = ::Lb::Product.find params[:id]
    @instance = @lb_product
  end

  def lb_product_param
    params.require(:lb_product).permit(:name, :icon, :brand_id, :desc, :price, :coupon_count, :reward_count)
  end
end
