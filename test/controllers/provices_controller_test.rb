require 'test_helper'

class ProvicesControllerTest < ActionController::TestCase
  setup do
    @provice = provices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create provice" do
    assert_difference('Provice.count') do
      post :create, provice: { name: @provice.name }
    end

    assert_redirected_to provice_path(assigns(:provice))
  end

  test "should show provice" do
    get :show, id: @provice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @provice
    assert_response :success
  end

  test "should update provice" do
    patch :update, id: @provice, provice: { name: @provice.name }
    assert_redirected_to provice_path(assigns(:provice))
  end

  test "should destroy provice" do
    assert_difference('Provice.count', -1) do
      delete :destroy, id: @provice
    end

    assert_redirected_to provices_path
  end
end
