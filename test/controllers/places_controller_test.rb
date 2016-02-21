require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  setup do
    @place = places(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:places)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create place" do
    assert_difference('Place.count') do
      post :create, place: { clicks: @place.clicks, comfort_max: @place.comfort_max, comfort_num: @place.comfort_num, crowd_current: @place.crowd_current, crowd_max: @place.crowd_max, locationx: @place.locationx, locationy: @place.locationy, name: @place.name, noise_max: @place.noise_max, noise_num: @place.noise_num }
    end

    assert_redirected_to place_path(assigns(:place))
  end

  test "should show place" do
    get :show, id: @place
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @place
    assert_response :success
  end

  test "should update place" do
    patch :update, id: @place, place: { clicks: @place.clicks, comfort_max: @place.comfort_max, comfort_num: @place.comfort_num, crowd_current: @place.crowd_current, crowd_max: @place.crowd_max, locationx: @place.locationx, locationy: @place.locationy, name: @place.name, noise_max: @place.noise_max, noise_num: @place.noise_num }
    assert_redirected_to place_path(assigns(:place))
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete :destroy, id: @place
    end

    assert_redirected_to places_path
  end
end
