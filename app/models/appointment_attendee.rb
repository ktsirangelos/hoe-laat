class AppointmentAttendee < ApplicationRecord
  belongs_to :appointment
  belongs_to :attendee, polymorphic: true
end
