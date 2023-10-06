require "test_helper"

class Play::TeamControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get play_team_index_url
    assert_response :success
  end

  test "should get show" do
    get play_team_show_url
    assert_response :success
  end
end
