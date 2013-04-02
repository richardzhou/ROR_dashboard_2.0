require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get retrieve_password" do
    get :retrieve_password
    assert_response :success
  end

end
