class Appointment < ApplicationRecord
  belongs_to :creator, class_name: "User", inverse_of: :created_appointments
  has_many :arrivals, dependent: :destroy
  has_many :appointment_attendees, dependent: :destroy
  has_many :attendees, through: :appointment_attendees, source: :attendee

  validates :location, presence: true
  validates :scheduled_time, presence: true
end
