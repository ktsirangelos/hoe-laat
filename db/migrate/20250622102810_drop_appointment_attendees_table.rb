class DropAppointmentAttendeesTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :appointment_attendees
  end
end
