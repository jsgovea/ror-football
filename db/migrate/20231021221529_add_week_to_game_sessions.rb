class AddWeekToGameSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :game_sessions, :week, :integer
  end
end
