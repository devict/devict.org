require 'test_helper'

class IrcUsersControllerTest < ActionController::TestCase
  setup do
    @jacob = irc_users(:jacob)
    @matthew = irc_users(:matthew)

    @seth = IrcUser.new({'handle' => 'seth'})
    @jonathan = IrcUser.new({'handle' => 'jonathan'})
  end

  test "should create irc_user" do
    assert_difference('IrcUser.count') do
      post :create, irc_user: { handle: @seth.handle }
    end
  end

  test "should not create an existing user" do
    assert_difference('IrcUser.count', 0) do
      post :create, irc_user: { handle: @jacob.handle }
    end
  end

  test "should purge and create multiple users" do
    users = Array.new
    users << { handle: @seth.handle }
    users << { handle: @jonathan.handle }

    assert_equal 2, IrcUser.count, "Did not purge existing and create two users"
  end

  test "should destroy irc_user" do
    assert_difference('IrcUser.count', -1) do
      delete :destroy, id: @jacob.handle
    end
  end
end
