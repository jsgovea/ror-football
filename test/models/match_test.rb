# == Schema Information
#
# Table name: matches
#
#  id           :bigint           not null, primary key
#  week         :integer
#  home_team_id :bigint           not null
#  away_team_id :bigint           not null
#  result       :string
#  date         :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  schedule_id  :bigint           not null
#
require "test_helper"

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
