class Contact < ApplicationRecord
  has_many :appointment_attendees, as: :attendee, dependent: :destroy
  has_many :attended_appointments, through: :appointment_attendees, source: :appointment
  has_many :arrivals, as: :trackable, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
