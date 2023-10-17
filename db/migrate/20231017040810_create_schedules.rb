class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :game_session, null: false, foreign_key: true
      t.integer :season
      t.references :matches, null: false, foreign_key: true

      t.timestamps
    end
  end
end
