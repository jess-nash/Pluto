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
    medicine_notifications.exists? || appointment_notifications.exists?
  end

  def medicine_notifications
    medicines.where(expiration_date: (Time.now).beginning_of_day..(Time.now+7.day).end_of_day).where(important: true)
  end

  def appointment_notifications
    appointments.where(time: (Time.now+1.day).beginning_of_day..(Time.now+3.day).end_of_day).where(important: true)
  end
end
