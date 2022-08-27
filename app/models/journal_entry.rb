class JournalEntry < ApplicationRecord
  belongs_to :pet
  belongs_to :user

  validates :name, presence: true, uniqueness: true, length: { in: 2..50 }
  validates :content, presence: true, length: { in: 5..1_000 }

  has_many_attached :photos

  acts_as_favoritable
end
