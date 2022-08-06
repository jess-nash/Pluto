class Appointment < ApplicationRecord
  belongs_to :pet

  validates :name, presence: true
  validates :time, presence: true

  # add (multiple) attached photo(s)
end
