class Medicine < ApplicationRecord
  belongs_to :pet

  validates :name, presence: true, length: { in: 2..30 }
  validates :dosage, presence: true, length: { in: 1..100 }
  validates :description, length: { in: 0..1_000 }

  has_many_attached :photos

end
