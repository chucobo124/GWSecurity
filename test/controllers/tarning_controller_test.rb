require 'test_helper'

class TarningControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
