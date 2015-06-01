class Admin::Lb::CouponsController < Admin::BaseController
  before_filter :find_coupon, :only => :edit

  def index
    @coupons = Lb::Coupon.page params[:page]
  end

  def edit
  end

  private
  def find_coupon
    @lb_coupon  = Lb::Coupon.find params[:id]
  end
end
