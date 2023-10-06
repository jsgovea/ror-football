require "test_helper"

class Play::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get play_home_index_url
    assert_response :success
  end

  test "should get show" do
    get play_home_show_url
    assert_response :success
  end
end
