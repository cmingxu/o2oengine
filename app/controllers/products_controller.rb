class ProductsController < ApplicationController
  def index
    respond_to do |format| 
      format.html do

        @categories = Category.all
        @products = Product.page params[:page]
        @category = Category.find_by_id params[:category_id]
        @title = @category.try :name
      end


      format.json do
        render :json => Lb::Product.all
      end

    end
  end

  def show
    @product = Product.find params[:id]
    @title = @product.name
  end
end
