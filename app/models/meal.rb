class Meal < ApplicationRecord
  belongs_to :pet

  validates :name, presence: true, length: { in: 2..30 }
  validates :description, length: { in: 2..150 }

  has_many_attached :photos
end
