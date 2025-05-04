class Arrival < ApplicationRecord
  belongs_to :appointment, optional: true
  belongs_to :tracker, class_name: "User", inverse_of: :tracked_arrivals
  belongs_to :trackable, polymorphic: true

  validates :actual_time, presence: true
end
