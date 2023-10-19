class ChangeMatchesIdToAllowNullInSchedules < ActiveRecord::Migration[7.0]
  def change
    change_column :schedules, :matches_id, :bigint, null: true
  end
end
