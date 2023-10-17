class Schedule < ApplicationRecord
  belongs_to :game_session
  has_many :matches
end
