class RemoveIntegerFromPlayer < ActiveRecord::Migration[7.0]
  def change
    remove_column :players, :integer, :string
  end
end
