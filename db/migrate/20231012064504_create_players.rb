class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :position
      t.references :team, null: false, foreign_key: true
      t.references :game_session, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.integer :salary
      t.integer :contract_length
      t.integer :overall
      t.integer :potential
      t.integer :loyalty
      t.integer :ambition
      t.integer :ball_control
      t.integer :dribbling
      t.integer :long_pass
      t.integer :short_pass
      t.integer :heading
      t.integer :short_power
      t.integer :finishing
      t.integer :long_shots
      t.integer :aggression
      t.string :composure
      t.string :integer
      t.integer :reactions
      t.integer :acceleration
      t.integer :stamina
      t.integer :strength
      t.integer :sprint_speed
      t.integer :marking
      t.integer :tackling
      t.string :player_description
      t.integer :transfer_value
      t.integer :jersery_number
      t.integer :gk_positioning
      t.integer :gk_diving
      t.integer :gk_handling
      t.integer :gk_kicking
      t.integer :gk_reflexes
      t.integer :injury_prone

      t.timestamps
    end
  end
end
