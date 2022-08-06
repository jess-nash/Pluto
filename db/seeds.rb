# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
puts "cleaning database..."
Pet.destroy_all
User.destroy_all

puts "Seeding database with Plutonians..."
password = "123456"

ken = User.create(
  name: "Ken",
  email: "ken@gmail.com",
  password: password,
  username: "Ken"
)
file = URI.open("https://avatars.githubusercontent.com/u/100769790?v=4")
ken.photo.attach(io: file, filename: 'ken.jpg', content_type: 'image/jpg')

jessica = User.create(
  name: "Jessica",
  email: "jessica@gmail.com",
  password: password,
  username: "Jessica"
)
file = URI.open("https://avatars.githubusercontent.com/u/97200803?v=4")
jessica.photo.attach(io: file, filename: 'jess.jpg', content_type: 'image/jpg')

tyler = User.create(
  name: "Tyler",
  email: "tyler@gmail.com",
  password: password,
  username: "Tyler"
)
file = URI.open("https://avatars.githubusercontent.com/u/101543224?v=4")
tyler.photo.attach(io: file, filename: 'tyler.jpg', content_type: 'image/jpg')

nicole = User.create(
  name: "Nicole",
  email: "nicole@gmail.com",
  password: password,
  username: "Nicole"
)
file = URI.open("https://avatars.githubusercontent.com/u/74501096?v=4")
nicole.photo.attach(io: file, filename: 'nicole.jpg', content_type: 'image/jpg')

puts "users created!"

puts "adding pets..."
pets = [
  {
    name: "Miel",
    description: "Miichan is the cutest kitty ever. I wub her so so much ♥ ♥ ♥",
    age: 2,
    weight: 7,
    chip_number: "LW123",
    user: nicole,
    url: ""
  },

  {
    name: "TJ",
    description: "Tyler Jr is my favoritest thing in the entire world. He protects me when I'm scared of the clown that lives under my bed.",
    age: 8,
    weight: 20,
    chip_number: "LW456",
    user: tyler,
    url: ""
  },

  {
    name: "Shitzu",
    description: "I went to a zoo and they only had one dog there. It was a...",
    weight: 2,
    user: tyler,
    url: ""
  },

  {
    name: "Basura",
    description: "I don't even like it. Hamtaro looking ass",
    age: 1,
    weight: 1,
    user: tyler,
    url: ""
  },

  {
    name: "Catapult",
    description: "She likes flying through the air.",
    age: 5,
    weight: 5,
    chip_number: "LW789",
    user: jessica,
    url: ""
  },

  {
    name: "Doggobot",
    description: "Why does he have such cold dead eyes...",
    chip_number: "LW848",
    user: jessica,
    url: ""
  },

  {
    name: "Miel",
    description: "Miichan is the cutest doggo ever. I wub him so so much ♥ ♥ ♥",
    age: 7,
    weight: 14,
    chip_number: "LW484",
    user: ken,
    url: ""
  },

  {
    name: "Valkyrie",
    description: "This cat is lowkey evil",
    age: 6,
    weight: 10,
    user: ken,
    url: ""
  }
]

i = 1
pets.each do |pet_info|
  pet = Pet.new(
    name: pet_info[:name],
    description: pet_info[:description],
    age: pet_info[:age],
    weight: pet_info[:weight],
    user: pet_info[:user],
    chip_number: pet_info[:chip_number]
  )

  puts "getting photo for pets..."
  downloaded_image = URI.open(pet_info[:url])
  pet.photo.attach(io: downloaded_image, filename: "pet#{i}.png", content_type: "image/png")
  i += 1
  if pet.save
    puts "#{pet.name} was saved!"
  else
    p pet.errors.messages
  end

  puts "Seeded successfully!"

end
