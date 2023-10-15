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

  validates :ball_control, inclusion: { in: 55..99 }
  validates :dribbling, inclusion: { in: 55..99 }
  validates :long_pass, inclusion: { in: 55..99 }
  validates :short_pass, inclusion: { in: 55..99 }
  validates :heading, inclusion: { in: 55..99 }
  validates :short_power, inclusion: { in: 55..99 }
  validates :finishing, inclusion: { in: 55..99 }
  validates :long_shots, inclusion: { in: 55..99 }
  validates :aggression, inclusion: { in: 55..99 }
  validates :composure, inclusion: { in: 55..99 }
  validates :reactions, inclusion: { in: 55..99 }
  validates :acceleration, inclusion: { in: 55..99 }
  validates :stamina, inclusion: { in: 55..99 }
  validates :strength, inclusion: { in: 55..99 }
  validates :marking, inclusion: { in: 55..99 }
  validates :tackling, inclusion: { in: 55..99 }
  validates :gk_positioning, inclusion: { in: 55..99 }
  validates :gk_diving, inclusion: { in: 55..99 }
  validates :gk_handling, inclusion: { in: 55..99 }
  validates :gk_kicking, inclusion: { in: 55..99 }
  validates :gk_reflexes, inclusion: { in: 55..99 }

  before_validation :adjust_skills_base_position

  private

  def adjust_skills_base_position
    case position
    when 'Goalkeeper'
      self.ball_control = [ball_control, rand(55..70)].min
      self.dribbling = [dribbling, rand(55..70)].min
      self.long_pass = [long_pass, rand(55..70)].min
      self.short_pass = [short_pass, rand(55..70)].min
      self.heading = [heading, rand(55..70)].min
      self.short_power = [short_power, rand(55..70)].min
      self.finishing = [finishing, rand(55..70)].min
      self.long_shots = [long_shots, rand(55..70)].min
      self.aggression = [aggression, rand(55..70)].min
      self.composure = [composure, rand(55..70)].min
      self.reactions = [reactions, rand(55..70)].min
      self.acceleration = [acceleration, rand(55..70)].min
      self.stamina = [stamina, rand(55..70)].min
      self.strength = [strength, rand(55..70)].min
      self.marking = [marking, rand(55..70)].min
      # self.tackling = [tackling, 65].min
      # self.gk_positioning = [gk_positioning, 65].min
      # self.gk_diving = [gk_diving, 65].min
      # self.gk_handling = [gk_handling, 65].min
      # self.gk_kicking = [gk_kicking, 65].min
      # self.gk_reflexes = [gk_reflexes, 65].min
    when 'Defender'
      self.ball_control = [ball_control, rand(55..70)].min
      self.dribbling = [dribbling, rand(55..70)].min
      # self.long_pass = [long_pass, rand(55..70)].min
      # self.short_pass = [short_pass, rand(55..70)].min
      # self.heading = [heading, rand(55..70)].min
      self.short_power = [short_power, rand(55..70)].min
      self.finishing = [finishing, rand(55..70)].min
      self.long_shots = [long_shots, rand(55..70)].min
      # self.aggression = [aggression, rand(55..70)].min
      # self.composure = [composure, rand(55..70)].min
      # self.reactions = [reactions, rand(55..70)].min
      # self.acceleration = [acceleration, rand(55..70)].min
      # self.stamina = [stamina, rand(55..70)].min
      # self.strength = [strength, rand(55..70)].min
      # self.marking = [marking, rand(55..70)].min
      # self.tackling = [tackling, 65].min
      self.gk_positioning = [gk_positioning, 55].min
      self.gk_diving = [gk_diving, 55].min
      self.gk_handling = [gk_handling, 55].min
      self.gk_kicking = [gk_kicking, 55].min
      self.gk_reflexes = [gk_reflexes, 55].min
    when 'Midfielder'
      # self.ball_control = [ball_control, rand(55..70)].min
      # self.dribbling = [dribbling, rand(55..70)].min
      # self.long_pass = [long_pass, rand(55..70)].min
      # self.short_pass = [short_pass, rand(55..70)].min
      # self.heading = [heading, rand(55..70)].min
      # self.short_power = [short_power, rand(55..70)].min
      self.finishing = [finishing, rand(55..70)].min
      self.long_shots = [long_shots, rand(55..70)].min
      # self.aggression = [aggression, rand(55..70)].min
      # self.composure = [composure, rand(55..70)].min
      # self.reactions = [reactions, rand(55..70)].min
      # self.acceleration = [acceleration, rand(55..70)].min
      # self.stamina = [stamina, rand(55..70)].min
      # self.strength = [strength, rand(55..70)].min
      self.marking = [marking, rand(55..70)].min
      self.tackling = [tackling, rand(55..70)].min
      self.gk_positioning = [gk_positioning, 55].min
      self.gk_diving = [gk_diving, 55].min
      self.gk_handling = [gk_handling, 55].min
      self.gk_kicking = [gk_kicking, 55].min
      self.gk_reflexes = [gk_reflexes, 55].min
    when 'Forward'
      # self.ball_control = [ball_control, rand(55..70)].min
      # self.dribbling = [dribbling, rand(55..70)].min
      self.long_pass = [long_pass, rand(55..70)].min
      self.short_pass = [short_pass, rand(55..70)].min
      self.heading = [heading, rand(55..70)].min
      self.short_power = [short_power, rand(55..70)].min
      self.finishing = [finishing, rand(55..70)].min
      # self.long_shots = [long_shots, rand(55..70)].min
      # self.aggression = [aggression, rand(55..70)].min
      # self.composure = [composure, rand(55..70)].min
      # self.reactions = [reactions, rand(55..70)].min
      # self.acceleration = [acceleration, rand(55..70)].min
      # self.stamina = [stamina, rand(55..70)].min
      # self.strength = [strength, rand(55..70)].min
      self.marking = [marking, rand(55..70)].min
      self.tackling = [tackling, rand(55..70)].min
      self.gk_positioning = [gk_positioning, 55].min
      self.gk_diving = [gk_diving, 55].min
      self.gk_handling = [gk_handling, 55].min
      self.gk_kicking = [gk_kicking, 55].min
      self.gk_reflexes = [gk_reflexes, 55].min


    end
  end

end
