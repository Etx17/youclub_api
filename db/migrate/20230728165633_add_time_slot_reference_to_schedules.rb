class AddTimeSlotReferenceToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_reference :schedules, :time_slot, foreign_key: true

    # Remove the time_slots column from the schedules table
    remove_column :schedules, :time_slots, :text
  end
end
