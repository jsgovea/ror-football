# == Schema Information
#
# Table name: match_stats
#
#  id              :bigint           not null, primary key
#  match_id        :bigint           not null
#  shots           :string
#  shots_on_target :string
#  possession      :string
#  pass_accuracy   :string
#  fouls           :string
#  yellow_cards    :string
#  red_cards       :string
#  offsides        :string
#  corners         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class MatchStat < ApplicationRecord
  belongs_to :match
end
