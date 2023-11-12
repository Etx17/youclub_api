class ChangeTimeSlotsToDateTime < ActiveRecord::Migration[7.0]
  def up
    change_column :time_slots, :start_time, 'timestamp USING CAST(start_time AS timestamp)'
    change_column :time_slots, :end_time, 'timestamp USING CAST(end_time AS timestamp)'
  end

  def down
    change_column :time_slots, :start_time, :string
    change_column :time_slots, :end_time, :string
  end
end
