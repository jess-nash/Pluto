class JournalEntry < ApplicationRecord
  belongs_to :pet

  validates :name, presence: true, uniqueness: true, length: { in: 2..30 }
  validates :content, presence: true, length: { in: 5..1_000 }

  # add (many) attached photo(s)
end
