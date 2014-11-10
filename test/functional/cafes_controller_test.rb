require 'test_helper'

class CafesControllerTest < ActionController::TestCase
  setup do
    @cafe = cafes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cafes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cafe" do
    assert_difference('Cafe.count') do
      post :create, cafe: { building_number: @cafe.building_number, cafe_description: @cafe.cafe_description, cafe_name: @cafe.cafe_name, contact_email: @cafe.contact_email, contact_tel: @cafe.contact_tel, latitude: @cafe.latitude, longitude: @cafe.longitude, opening_hours: @cafe.opening_hours, postcode: @cafe.postcode, street_name: @cafe.street_name, website_link: @cafe.website_link, wifi_network_name: @cafe.wifi_network_name, wifi_password: @cafe.wifi_password }
    end

    assert_redirected_to cafe_path(assigns(:cafe))
  end

  test "should show cafe" do
    get :show, id: @cafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cafe
    assert_response :success
  end

  test "should update cafe" do
    put :update, id: @cafe, cafe: { building_number: @cafe.building_number, cafe_description: @cafe.cafe_description, cafe_name: @cafe.cafe_name, contact_email: @cafe.contact_email, contact_tel: @cafe.contact_tel, latitude: @cafe.latitude, longitude: @cafe.longitude, opening_hours: @cafe.opening_hours, postcode: @cafe.postcode, street_name: @cafe.street_name, website_link: @cafe.website_link, wifi_network_name: @cafe.wifi_network_name, wifi_password: @cafe.wifi_password }
    assert_redirected_to cafe_path(assigns(:cafe))
  end

  test "should destroy cafe" do
    assert_difference('Cafe.count', -1) do
      delete :destroy, id: @cafe
    end

    assert_redirected_to cafes_path
  end
end
