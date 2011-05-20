require 'test_helper'

class SperrensControllerTest < ActionController::TestCase
  setup do
    @sperren = sperrens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sperrens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sperren" do
    assert_difference('Sperren.count') do
      post :create, :sperren => @sperren.attributes
    end

    assert_redirected_to sperren_path(assigns(:sperren))
  end

  test "should show sperren" do
    get :show, :id => @sperren.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sperren.to_param
    assert_response :success
  end

  test "should update sperren" do
    put :update, :id => @sperren.to_param, :sperren => @sperren.attributes
    assert_redirected_to sperren_path(assigns(:sperren))
  end

  test "should destroy sperren" do
    assert_difference('Sperren.count', -1) do
      delete :destroy, :id => @sperren.to_param
    end

    assert_redirected_to sperrens_path
  end
end
