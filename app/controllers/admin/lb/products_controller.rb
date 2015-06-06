class Admin::Lb::ProductsController < Admin::BaseController
  include PositionMover
  before_filter :find_product, :only => [:show, :edit, :update, :destroy, :move_higher, :move_lower]

  def index
    @products = ::Lb::Product.page params[:page]

    respond_to do |format|
      format.html 

      format.json do
        render :json => @products
      end
      
    end
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

  def destroy
    @lb_product.destroy
    redirect_to admin_lb_products_path
  end

  def move_higher
    @lb_product.move_higher
    redirect_to admin_lb_products_path
  end

  def move_lower
    @lb_product.move_lower
    redirect_to admin_lb_products_path
  end

  private
  def find_product
    @lb_product = ::Lb::Product.find params[:id]
    @instance = @lb_product
  end

  def lb_product_param
    params.require(:lb_product).permit(:name, :icon, :brand, :desc, :price, :water_type, :container_type)
  end
end
