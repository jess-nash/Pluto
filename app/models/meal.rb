class Meal < ApplicationRecord
  belongs_to :pet

  validates :meal_type, presence: true, length: { in: 2..30 }
  validates :description, length: { in: 2..150 }
  validates :time, length: { in: 1..50 }

  has_many_attached :photos
end
