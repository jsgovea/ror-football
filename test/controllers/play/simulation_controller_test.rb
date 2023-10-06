require "test_helper"

class Play::SimulationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get play_simulation_index_url
    assert_response :success
  end

  test "should get show" do
    get play_simulation_show_url
    assert_response :success
  end
end
