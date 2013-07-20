require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test 'show action' do
    get 'events/1'
    assert_response :success
  end
end
