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
class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'
  belongs_to :schedule
end
