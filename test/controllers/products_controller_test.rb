require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { desc: @product.desc, name: @product.name, pic1: @product.pic1, pic2: @product.pic2, pic3: @product.pic3, pic4: @product.pic4, price: @product.price, quantity: @product.quantity, sku: @product.sku }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { desc: @product.desc, name: @product.name, pic1: @product.pic1, pic2: @product.pic2, pic3: @product.pic3, pic4: @product.pic4, price: @product.price, quantity: @product.quantity, sku: @product.sku }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
