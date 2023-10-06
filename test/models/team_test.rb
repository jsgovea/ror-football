# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  name       :string
#  league_id  :bigint           not null
#  prestige   :integer
#  home_color :string
#  away_color :string
#  off_value  :integer
#  mid_value  :integer
#  def_value  :integer
#  abbrev     :string
#  budget     :integer
#  overall    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
