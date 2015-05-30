class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.page params[:page]
    @category = Category.find_by_id params[:category_id]
    @title = @category.try :name
  end

  def show
    @product = Product.find params[:id]
    @title = @product.name
  end
end
