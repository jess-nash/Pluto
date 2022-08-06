class Medicine < ApplicationRecord
  belongs_to :pet

  validates :name, presence: true, length: { in: 2..30 }
  validates :dosage, presence: true, length: { in: 2..100 }
  validates :description, length: { in: 2..1_000 }

  # add (multiple) attached photo(s)
end
