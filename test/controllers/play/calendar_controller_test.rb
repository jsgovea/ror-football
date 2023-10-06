require "test_helper"

class Play::CalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get play_calendar_index_url
    assert_response :success
  end

  test "should get show" do
    get play_calendar_show_url
    assert_response :success
  end
end
