class CreateAppointmentAttendees < ActiveRecord::Migration[8.0]
  def change
    create_table :appointment_attendees do |t|
      t.references :appointment, null: false, foreign_key: true
      t.references :attendee, polymorphic: true, null: false

      t.timestamps
    end
    add_index :appointment_attendees, [
                :appointment_id,
                :attendee_type,
                :attendee_id
              ],
              name: 'index_appointment_attendees_on_appointment_and_attendee'
  end
end
