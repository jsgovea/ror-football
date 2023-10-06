require "test_helper"

class GameSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game_sessions_index_url
    assert_response :success
  end

  test "should get show" do
    get game_sessions_show_url
    assert_response :success
  end
end
