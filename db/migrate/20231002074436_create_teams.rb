class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :league, null: false, foreign_key: true
      t.integer :prestige
      t.string :home_color
      t.string :away_color
      t.integer :off_value
      t.integer :mid_value
      t.integer :def_value
      t.string :abbrev
      t.integer :budget
      t.integer :overall

      t.timestamps
    end
  end
end
