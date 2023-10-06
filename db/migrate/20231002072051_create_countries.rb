class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :flag_emoji
      t.string :capital
      t.string :population

      t.timestamps
    end
  end
end
