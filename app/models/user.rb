class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :created_appointments, class_name: "Appointment",
    foreign_key: "creator_id", dependent: :destroy, inverse_of: :creator
  has_many :tracked_arrivals, class_name: "Arrival",
    foreign_key: "tracker_id", dependent: :destroy, inverse_of: :tracker
  has_many :arrivals, as: :trackable, dependent: :destroy
  has_many :appointment_attendees, as: :attendee, dependent: :destroy
  has_many :attended_appointments, through: :appointment_attendees, source: :appointment
end
