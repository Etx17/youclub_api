class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :sub_group, null: false, foreign_key: true
      t.string :day
      t.text :time_slots

      t.timestamps
    end
  end
end
