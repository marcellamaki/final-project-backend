class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.string :time
      t.belongs_to :user, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
