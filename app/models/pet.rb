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

  def final_message(message)
    {
      type: 'text',
      text: message
    }
  end

  def send_meal_message
    users.each do |user|
      destination = user.line_id
      return unless destination
      linebot = LineBot.new(destination)
      message = "👋 Hello #{user.name}! 🐶🐱\n"
      breakfast_meals = meals.where("time && ?", "{Breakfast}")
      lunch_meals = meals.where("time && ?", "{Lunch}")
      dinner_meals = meals.where("time && ?", "{Dinner}")
      snack_meals = meals.where("time && ?", "{Snack}")
      breakfast_message = "Breakfast: #{breakfast_meals.map {|meal| "#{meal.name}- #{meal.serving_size}" }.join(", ")} \n" +
      "Lunch: #{lunch_meals.map {|meal| "#{meal.name}- #{meal.serving_size}" }.join(", ")} \n" +
      "Dinner: #{dinner_meals.map {|meal| "#{meal.name}- #{meal.serving_size}" }.join(", ")} \n" +
      "Snack: #{snack_meals.map {|meal| "#{meal.name}- #{meal.serving_size}" }.join(", ")}"
      p full_message =  message + breakfast_message
      p linebot.client.push_message(destination, final_message(full_message))
    end
  end

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
