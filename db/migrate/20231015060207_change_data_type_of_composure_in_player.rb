class ChangeDataTypeOfComposureInPlayer < ActiveRecord::Migration[7.0]
  def change
    change_column :players, :composure, 'integer USING CAST(composure AS integer)'
  end
end
