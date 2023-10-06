# == Schema Information
#
# Table name: game_sessions
#
#  id               :bigint           not null, primary key
#  name             :string
#  current_year     :integer
#  current_date     :datetime
#  team_id          :bigint           not null
#  last_time_played :datetime
#  user_id          :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require "test_helper"

class GameSessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
