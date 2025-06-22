class DropAppointmentsTable < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :arrivals, :appointments
    remove_foreign_key :appointment_attendees, :appointments
    drop_table :appointments
  end
end
