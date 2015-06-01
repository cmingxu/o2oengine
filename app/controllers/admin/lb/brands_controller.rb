class Admin::Lb::BrandsController < Admin::BaseController
  include PositionMover
  before_filter :find_brand, :only => [:show, :edit, :update, :destroy]

  def index
    @brands = ::Lb::Brand.page params[:page]
  end

  def edit
    render layout: false
  end

  def new
    @lb_brand = ::Lb::Brand.new
    render layout: false
  end

  def update
    @lb_brand.update_attributes lb_brand_param
    if @lb_brand.save
      redirect_to admin_lb_brands_path, :notice => ""
    else
      render :edit
    end
  end

  def create
    @lb_brand = ::Lb::Brand.new lb_brand_param
    if @lb_brand.save
      redirect_to admin_lb_brands_path, :notice => ""
    else
      render :new
    end
  end

  def destroy
    @lb_brand.destroy
    redirect_to :back
  end

  private
  def find_brand
    @lb_brand = ::Lb::Brand.find params[:id]
    @instance = @lb_brand
  end

  def lb_brand_param
    params.require(:lb_brand).permit(:name, :icon, :water_type, :desc)
  end
end
