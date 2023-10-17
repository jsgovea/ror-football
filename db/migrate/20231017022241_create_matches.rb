class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.integer :week
      t.references :home_team, null: false, foreign_key: { to_table: :teams }
      t.references :away_team, null: false, foreign_key: { to_table: :teams }
      t.string :result
      t.datetime :date

      t.timestamps
    end
  end
end