# == Schema Information
#
# Table name: leagues
#
#  id         :bigint           not null, primary key
#  name       :string
#  division   :integer
#  country_id :bigint           not null
#  prestige   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class LeagueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
