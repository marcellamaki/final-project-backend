class CreateCheckins < ActiveRecord::Migration[5.1]
  def change
    create_table :checkins do |t|
      t.integer :reminder_id

      t.timestamps
    end
  end
end
