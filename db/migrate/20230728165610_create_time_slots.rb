class CreateTimeSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :time_slots do |t|
      t.references :schedule, foreign_key: true
      t.string :start_time
      t.string :end_time
      t.timestamps
    end
  end
end
