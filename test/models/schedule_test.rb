# == Schema Information
#
# Table name: schedules
#
#  id              :bigint           not null, primary key
#  game_session_id :bigint           not null
#  season          :integer
#  matches_id      :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "test_helper"

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
