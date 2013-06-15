require 'test_helper'

class IrcControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get alt" do
    get :alt
    assert_response :success
  end

  test "should get alt2" do
    get :alt2
    assert_response :success
  end

end
