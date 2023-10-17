class CreateMatchStats < ActiveRecord::Migration[7.0]
  def change
    create_table :match_stats do |t|
      t.references :match, null: false, foreign_key: true
      t.string :shots
      t.string :shots_on_target
      t.string :possession
      t.string :pass_accuracy
      t.string :fouls
      t.string :yellow_cards
      t.string :red_cards
      t.string :offsides
      t.string :corners

      t.timestamps
    end
  end
end
