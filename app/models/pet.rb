class Pet < ApplicationRecord
  has_many :ownerships
  has_many :users, through: :ownerships
  # , as: :owners
  has_many :medicines
  has_many :meals
  has_many :journal_entries
  has_many :appointments

  validates :name, presence: true, length: { maximum: 30 }

  has_one_attached :photo

  def has_notifications?
    unless medicines.where(important: true).empty? && appointments.where(important: true).empty?
      true
    end
  end

  def has_medicine_notifications?
    unless medicines.where(important: true).empty?
      true
    end
  end

  def has_appointment_notifications?
    unless appointments.where(important: true).empty?
      true
    end
  end
end
