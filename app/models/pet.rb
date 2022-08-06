class Pet < ApplicationRecord
  belongs_to :family
  has_many :users, through: :families
  has_many :medicines
  has_many :meals
  has_many :journal_entries
  has_many :appointments

  validates :name, presence: true, uniqueness: { scope: :user }, length: { maximum: 30 }

  # add (1) attached photo
end
