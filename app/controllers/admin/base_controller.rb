class Admin::BaseController < ApplicationController
  layout "admin"
  skip_before_filter :load_cart
  before_filter :login_required

  CONTROLLER_NAME_MAP = {
    :product => "商品",
    :category => "品类",
    :branch => "门店",
    :user => "用户",
    :order => "订单"
  }

  before_filter do
    @current_active_nav = params[:controller].split("/")[1].singularize
    breadcrumb_entries
  end

  helper_method :logged_in?

  def logged_in?
    false
  end

  def index
  end

  def push_breadcrumb(obj)
    @breadcrumb.push(obj)
  end

  def pop_breadcrumb
    @breadcrumb.pop
  end

  def empty_breadcrumb
    @breadcrumb = []
  end

  def breadcrumb_entries
    @breadcrumb ||= []
  end
end
