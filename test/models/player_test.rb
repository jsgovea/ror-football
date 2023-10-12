# == Schema Information
#
# Table name: players
#
#  id                 :bigint           not null, primary key
#  first_name         :string
#  last_name          :string
#  age                :integer
#  position           :string
#  team_id            :bigint           not null
#  game_session_id    :bigint           not null
#  country_id         :bigint           not null
#  salary             :integer
#  contract_length    :integer
#  overall            :integer
#  potential          :integer
#  loyalty            :integer
#  ambition           :integer
#  ball_control       :integer
#  dribbling          :integer
#  long_pass          :integer
#  short_pass         :integer
#  heading            :integer
#  short_power        :integer
#  finishing          :integer
#  long_shots         :integer
#  aggression         :integer
#  composure          :string
#  integer            :string
#  reactions          :integer
#  acceleration       :integer
#  stamina            :integer
#  strength           :integer
#  sprint_speed       :integer
#  marking            :integer
#  tackling           :integer
#  player_description :string
#  transfer_value     :integer
#  jersery_number     :integer
#  gk_positioning     :integer
#  gk_diving          :integer
#  gk_handling        :integer
#  gk_kicking         :integer
#  gk_reflexes        :integer
#  injury_prone       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
