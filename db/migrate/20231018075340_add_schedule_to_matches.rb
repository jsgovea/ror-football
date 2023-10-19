class AddScheduleToMatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :matches, :schedule, null: false, foreign_key: true
  end
end
