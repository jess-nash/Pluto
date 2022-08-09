class Pet < ApplicationRecord
  belongs_to :ownership
  has_many :users, through: :ownerships
  has_many :medicines
  has_many :meals
  has_many :journal_entries
  has_many :appointments

  validates :name, presence: true, length: { maximum: 30 }

  has_one_attached :photo
end
