class CreateReminderTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :reminder_times do |t|
      t.integer :reminder_id
      t.datetime :time

      t.timestamps
    end
  end
end
