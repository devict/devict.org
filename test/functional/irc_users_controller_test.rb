require 'test_helper'

class IrcUsersControllerTest < ActionController::TestCase
  setup do
    @irc_user = irc_users(:one)
  end

  test "should create irc_user" do
    assert_difference('IrcUser.count') do
      post :create, irc_user: { handle: @irc_user.handle }
    end
  end

  test "should destroy irc_user" do
    assert_difference('IrcUser.count', -1) do
      delete :destroy, id: @irc_user.handle
    end
  end
end
