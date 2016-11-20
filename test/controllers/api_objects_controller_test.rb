require 'test_helper'

class ApiObjectsControllerTest < ActionController::TestCase
  setup do
    @api_object = api_objects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_objects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_object" do
    assert_difference('ApiObject.count') do
      post :create, api_object: { key: @api_object.key, value: @api_object.value }
    end

    assert_redirected_to api_object_path(assigns(:api_object))
  end

  test "should show api_object" do
    get :show, id: @api_object
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_object
    assert_response :success
  end

  test "should update api_object" do
    patch :update, id: @api_object, api_object: { key: @api_object.key, value: @api_object.value }
    assert_redirected_to api_object_path(assigns(:api_object))
  end

  test "should destroy api_object" do
    assert_difference('ApiObject.count', -1) do
      delete :destroy, id: @api_object
    end

    assert_redirected_to api_objects_path
  end
end
