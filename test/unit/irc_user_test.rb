require 'test_helper'

class IrcUserTest < ActiveSupport::TestCase
  test "must have a handle" do
    user = IrcUser.new()
    assert !user.save, "Saved user without a handle"
  end
end
