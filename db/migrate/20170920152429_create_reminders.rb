class CreateReminders < ActiveRecord::Migration[5.1]
  def change
    create_table :reminders do |t|
      t.integer :question_id
      t.string :message
      t.boolean :active
      t.string :time

      t.timestamps
    end
  end
end
