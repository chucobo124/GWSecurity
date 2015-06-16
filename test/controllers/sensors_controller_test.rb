require 'test_helper'

class SensorsControllerTest < ActionController::TestCase
  test "no login should get index then redirect 302" do
    get :index
    assert_response :redirect
  end

  test "after login should get index" do
    sign_in users(:user1)
    get :index
    assert_response :success
  end

  test "no login should get show then redirect 302" do
    get(:show, {'id'=>'1'})
    assert_response :redirect
  end

  test "after login should get show" do
    sign_in users(:user1)
    get(:show, {'id'=>'1'})
    assert_response :success
  end
end
