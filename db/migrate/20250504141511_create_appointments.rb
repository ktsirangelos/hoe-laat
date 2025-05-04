class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :location
      t.datetime :scheduled_time
      t.references :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
