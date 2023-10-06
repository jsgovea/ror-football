class CreateGameSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :game_sessions do |t|
      t.string :name
      t.integer :current_year
      t.datetime :current_date
      t.references :team, null: false, foreign_key: true
      t.datetime :last_time_played
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
