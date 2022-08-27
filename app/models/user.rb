class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :name, presence: true

  has_many :ownerships

  has_many :pets, through: :ownerships
  has_many :meals, through: :pets
  has_many :medicines, through: :pets
  has_many :appointments, through: :pets

  has_one_attached :photo

  has_many :journal_entries_as_owner, through: :pets, source: :journal_entries

  def send_line_message
    destination = self.line_id
    return unless destination
    linebot = LineBot.new(destination)

    message = "Hello #{self.name}! "
    message += format_appointments_message
    message += format_medicines_message
    # message += format_meals_message

    final_message = {
      type: 'text',
      text: message
    }
    linebot.client.push_message(destination, final_message)
  end

  # day before and day of
  def format_appointments_message
    appointments = Appointment.where(pet_id: self.pets.pluck(:id)).where("time < ?", Time.now-1.day).exists?
    message_text = ""
    message_text += "Your pet has an appointment today!"

    appointments = Appointment.where(pet_id: self.pets.pluck(:id)).where("time < ?", Time.now.end_of_day).exists?
    message_text = ""
    message_text += "Your pet has an appointment today!"
  end

  # three days before
  def format_medicines_message
    medicines = Medicine.where(pet_id: self.pets.pluck(:id)).where("expiration_date < ?", Time.now-3.days).exists?
    message_text = ""
    # byebug
    message_text += "Your pet's medication expires in 3 days!"

    medicines = Medicine.where(pet_id: self.pets.pluck(:id)).where("expiration_date < ?", Time.now-2.days).exists?
    message_text = ""
    message_text += "Your pet's medication expires in 2 days!"

    medicines = Medicine.where(pet_id: self.pets.pluck(:id)).where("expiration_date < ?", Time.now.end_of_day).exists?
    message_text = ""
    message_text += "Your pet's medication expires today!"
  end


  def format_meals_message
  #  breakfast_time = Time.parse('8am')
  #  lunch_time = Time.parse('12pm')
  #  dinner_time = Time.parse('5pm')
#
  #  meals = Meals.where(pet_id: self.pets.pluck(:id)).where("time = breakfast")
  end
end
