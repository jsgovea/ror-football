require "test_helper"

class Play::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get play_settings_index_url
    assert_response :success
  end

  test "should get show" do
    get play_settings_show_url
    assert_response :success
  end
end
