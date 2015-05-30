class CartController < ApplicationController
  def index
  end

  def add
    @cart.add params[:id], params[:quantity]
    redirect_to carts_path
  end

  def decrease
    @cart.decrease params[:id], params[:quantity]
    redirect_to carts_path
  end

  def remove
    @cart.remove params[:id]
    redirect_to carts_path
  end

  def check_out
  end
end
