require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  test 'sync action' do
    get :sync
    assert_response :success
  end

  test 'show action' do
    get 'events/1'
    assert_response :success
  end
end
