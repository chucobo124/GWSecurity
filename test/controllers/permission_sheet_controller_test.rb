require 'test_helper'

class PermissionSheetControllerTest < ActionController::TestCase
  test "should get index" do
    sign_in users(:user1)
    get :index
    assert_response :success
  end

end
