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

  acts_as_favoritor

  def final_message(message)
    {
      type: 'text',
      text: message
    }
  end

  def send_line_message
    destination = self.line_id
    return unless destination
    linebot = LineBot.new(destination)

    message = "👋 Hello #{self.name}! 🐶🐱"
    appointment_message = format_appointments_message
    appointment_message_today = format_appointments_message_today
    medication_expiration_message = format_medicines_expiration_message
    # medicine_message = format_medicines_message
    # message += format_meals_message

    linebot.client.push_message(destination, final_message(message))
    linebot.client.push_message(destination, final_message(appointment_message)) unless appointment_message.empty?
    linebot.client.push_message(destination, final_message(appointment_message_today)) unless appointment_message_today.empty?
    linebot.client.push_message(destination, final_message(medication_expiration_message)) unless medication_expiration_message.empty?
  # linebot.client.push_message(destination, final_message(medicine_message)) unless medicine_message.empty?
  end

  def format_appointments_message
    message_text = ""
    appointments = Appointment.where(pet_id: self.pets.pluck(:id)).where(time: (Time.now+1.day).beginning_of_day..(Time.now+1.day).end_of_day)
    appointments = appointments.select { |appointment| appointment.important }
    # byebug if self.email == "tyler@gmail.com"
    pet_names = appointments.map(&:pet).map(&:name)
    message_text += " 🐾 Your pet #{pet_names.join(", ")} has an appointment tomorrow! 🏥"
  end

  def format_appointments_message_today
    message_text = ""
    appointments = Appointment.where(pet_id: self.pets.pluck(:id)).where(time: Time.now.beginning_of_day..Time.now.end_of_day)
    appointments = appointments.select { |appointment| appointment.important }
    # byebug if self.email == "tyler@gmail.com"
    pet_names = appointments.map(&:pet).map(&:name)
    message_text += " 🐾 Your pet #{pet_names.join(", ")} has an appointment today! 🏥"
  end

  def format_medicines_expiration_message
    message_text = ""
    medicine_3days = Medicine.where(pet_id: self.pets.pluck(:id)).where(expiration_date: (Time.now+3.day).beginning_of_day..(Time.now+3.day).end_of_day)
    pet_names_3 = medicine_3days.map(&:pet).map(&:name)
    message_text + " 🐾 Hey, just a heads up, #{pet_names_3.join(", ")}'s medication expires in 3 days! 💊"

    medicine_2days = Medicine.where(pet_id: self.pets.pluck(:id)).where(expiration_date: (Time.now+2.day).beginning_of_day..(Time.now+2.day).end_of_day)
    pet_names_2 = medicine_2days.map(&:pet).map(&:name)
    message_text + " 🐾 Hey, just a heads up, #{pet_names_2.join(", ")}'s medication expires in 2 days! 💊"

    medicine_tomorrow = Medicine.where(pet_id: self.pets.pluck(:id)).where(expiration_date: (Time.now+1.day).beginning_of_day..(Time.now+1.day).end_of_day)
    pet_names_tomorrow = medicine_tomorrow.map(&:pet).map(&:name)
    message_text +" ⚠ #{pet_names_tomorrow.join(", ")}'s medication expires tomorrow! ⚠"

    medicine_today = Medicine.where(pet_id: self.pets.pluck(:id)).where("expiration_date < ?", Time.now.end_of_day)
    pet_names_today = medicine_today.map(&:pet).map(&:name)
    message_text +" ⚠ #{pet_names_today.join(", ")}'s medication expires today! ⚠"
  end

  def format_medicines_message
    message_text = ""
    medicine = Medicine.where(pet_id: self.pets.pluck(:id)).where()
  end


  def format_meals_message
  #  breakfast_time = Time.parse('8am')
  #  lunch_time = Time.parse('12pm')
  #  dinner_time = Time.parse('5pm')
#
  #  meals = Meals.where(pet_id: self.pets.pluck(:id)).where("time = breakfast")
  end
end


#TODO:
# 1. Make it so that if a medication, meals, or appointments are important, then it notifies.
# 2. Make the notifications seperate messages
# 3. Personalize the messages, (ex. add Pet's name.)
# 4. When user sends message, it asks for users email and applies their line ID to their account (email)

#TODO 2.0:
# 1. get medication times????
