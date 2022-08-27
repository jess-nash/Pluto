class Ownership < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :pet, uniqueness: { scope: :user }
end
