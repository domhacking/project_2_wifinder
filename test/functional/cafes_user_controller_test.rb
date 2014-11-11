require 'test_helper'

class CafesUserControllerTest < ActionController::TestCase
  setup do
    @cafes_user = cafes_user(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cafes_user)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cafes_user" do
    assert_difference('CafeUser.count') do
      post :create, cafes_user: {  }
    end

    assert_redirected_to cafes_user_path(assigns(:cafes_user))
  end

  test "should show cafes_user" do
    get :show, id: @cafes_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cafes_user
    assert_response :success
  end

  test "should update cafes_user" do
    put :update, id: @cafes_user, cafes_user: {  }
    assert_redirected_to cafes_user_path(assigns(:cafes_user))
  end

  test "should destroy cafes_user" do
    assert_difference('CafeUser.count', -1) do
      delete :destroy, id: @cafes_user
    end

    assert_redirected_to cafes_user_path
  end
end
