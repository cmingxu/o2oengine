class Admin::StaffsController < Admin::BaseController
  def index
    @staffs = Staff.page params[:page]
  end

  def edit
    @staff = Staff.find params[:id]
    render :layout => false
  end

  def new
    @staff = Staff.new
    render :layout => false
  end

  def create
    @staff = Staff.new staff_param
    @staff.save
    redirect_to admin_staffs_path
  end

  def update
    @staff = Staff.find params[:id]
    @staff.update_attributes staff_param
    @staff.save
    redirect_to admin_staffs_path
  end

  def destroy
    @staff = Staff.find params[:id]
    @staff.destroy
    redirect_to admin_staffs_path
  end

  private
  def staff_param
    params.require(:staff).permit(:login, :password, :avatar, :mobile, :name)
  end
end
