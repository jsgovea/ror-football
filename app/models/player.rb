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
#  composure          :integer
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
class Player < ApplicationRecord
  belongs_to :team
  belongs_to :game_session
  belongs_to :country

  POSITIONS = ['Goalkeeper', 'Defender', 'Midfielder', 'Forward']
  validates :position, inclusion: { in: POSITIONS }

  private

  def adjust_skills_base_position
    case position
    when 'Defender'
      self.ball_control = [self.ball_control, 75].min
      self.dribbling = [self.dribbling, 70].min
      self.short_power =  [self.short_power, 75].min
      self.finishing = [self.finishing, 65].min
      self.long_shots = [self.long_shots, 60].min
      self.acceleration = [self.acceleration, 70].min
      self.stamina = [self.stamina, 55].min
    when 'Midfielder'
      self.heading = [self.heading, 70].min
      self.finishing = [self.finishing, 70].min
      self.stamina = [self.stamina, 55].min
      self.strength = [self.strength, 75].min
      self.marking = [self.marking, 75].min
      self.tackling = [self.tackling, 75].min
    when 'Forward'
      self.long_pass = [self.long_pass, 75].min
      self.aggression = [self.aggression, 75].min
      self.marking = [self.marking, 75].min
      self.tackling = [self.tackling, 65].min
    end
  end
end
