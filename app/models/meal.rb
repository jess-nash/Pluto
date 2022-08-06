class Meal < ApplicationRecord
  belongs_to :pet

  validates :meal_type, presence: true, length: { in: 2..30 }
  validates :description, length: { in: 2..50 }
  validates :time, length: { in: 2..50 }

  # add (multiple) attached photo(s)
end
