require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test 'should get all' do
    get events_all_url
    assert_response :success
  end
end
