require "test_helper"

class Play::LeagueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get play_league_index_url
    assert_response :success
  end

  test "should get show" do
    get play_league_show_url
    assert_response :success
  end
end
