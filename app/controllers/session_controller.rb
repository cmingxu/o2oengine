class SessionController < ApplicationController
  def login
    if request.post?
      if @staff = Staff.login(user_params[:login], user_params[:password])
        session[:staff_id] = @staff.id
        redirect_to admin_path, notice: "欢迎回来，#{@staff.login}"
      else
        redirect_to login_path, alert: "用户名密码不正确， 或者您尚未激活账号."
      end
    end
  end

  def user_params
    params.require(:user).permit(:login, :password)
  end
end
