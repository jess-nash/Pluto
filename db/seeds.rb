# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
puts "cleaning database..."
Ownership.destroy_all
Pet.destroy_all
User.destroy_all
JournalEntry.destroy_all

def create_users

  password = "123456"

  nicole = User.create(
    name: "Nicole",
    email: "nicole@gmail.com",
    password: password,
    username: "Nicole"
  )
  file = URI.open("https://avatars.githubusercontent.com/u/74501096?v=4")
  nicole.photo.attach(io: file, filename: 'nicole.jpg', content_type: 'image/jpg')

  tyler = User.create(
    name: "Tyler",
    email: "tyler@gmail.com",
    password: password,
    username: "Tyler"
  )
  file = URI.open("https://avatars.githubusercontent.com/u/101543224?v=4")
  tyler.photo.attach(io: file, filename: 'tyler.jpg', content_type: 'image/jpg')

  jessica = User.create(
    name: "Jessica",
    email: "jessica@gmail.com",
    password: password,
    username: "Jessica"
  )
  file = URI.open("https://avatars.githubusercontent.com/u/97200803?v=4")
  jessica.photo.attach(io: file, filename: 'jess.jpg', content_type: 'image/jpg')

  ken = User.create(
    name: "Ken",
    email: "ken@gmail.com",
    password: password,
    username: "Ken"
  )
  file = URI.open("https://avatars.githubusercontent.com/u/100769790?v=4")
  ken.photo.attach(io: file, filename: 'ken.jpg', content_type: 'image/jpg')

  [nicole, tyler, jessica, ken]
end

def create_pets
  pets = [
    {
      name: "Miel",
      description: "Miichan is the cutest kitty ever. I wub her so so much ♥ ♥ ♥",
      age: 2,
      weight: 7,
      chip_number: "LW123",
      url: ""
    },

    {
      name: "TJ",
      description: "Tyler Jr is my favoritest thing in the entire world. He protects me when I'm scared of the clown that lives under my bed.",
      age: 8,
      weight: 20,
      chip_number: "LW456",
      url: ""
    },

    {
      name: "Shitzu",
      description: "I went to a zoo and they only had one dog there. It was a...",
      weight: 2,
      url: ""
    },

    {
      name: "Basura",
      description: "I don't even like it. Hamtaro looking ass",
      age: 1,
      weight: 1,
      url: ""
    },

    {
      name: "Catapult",
      description: "She likes flying through the air.",
      age: 5,
      weight: 5,
      chip_number: "LW789",
      url: ""
    },

    {
      name: "Doggobot",
      description: "Why does he have such cold dead eyes...",
      chip_number: "LW848",
      url: ""
    },

    {
      name: "Miel",
      description: "Miichan is the cutest doggo ever. I wub him so so much ♥ ♥ ♥",
      age: 7,
      weight: 14,
      chip_number: "LW484",
      url: ""
    },

    {
      name: "Valkyrie",
      description: "This cat is lowkey evil",
      age: 6,
      weight: 10,
      url: ""
    }
  ]

  pet_instances = []
  pets.each do |pet_info|
    pet_instances << Pet.create!(
      name: pet_info[:name],
      description: pet_info[:description],
      age: pet_info[:age],
      weight: pet_info[:weight],
      chip_number: pet_info[:chip_number]
    )
  end
  pet_instances
end

def create_ownerships(users, pets)
  pets.each_slice(2).with_index do |(pet_1, pet_2), i|
    Ownership.create(user: users[i], pet: pet_1)
    Ownership.create(user: users[i], pet: pet_2)
  end
end

puts "Seeding database with Plutonians..."
users = create_users
puts "users created!"
puts "adding pets..."
pets = create_pets
puts "pets created!"
puts "creating family"
create_ownerships(users, pets)
puts "family created"
puts "adding journals..."

journal1 = JournalEntry.create(
  name: Faker::Lorem.sentence(word_count: 3),
  content: Faker::JapaneseMedia::StudioGhibli.quote
)
file = URI.open("https://api.kyivindependent.com/storage/2021/12/loveyoustepan.-instagram-1024x683.jpg")
journal1.photos.attach(io: file, filename: 'journal.jpg', content_type: 'image/jpg')

journal2 = JournalEntry.create(
  name: Faker::Lorem.sentence(word_count: 5),
  content: Faker::JapaneseMedia::StudioGhibli.quote
)
file = URI.open("https://i.imgur.com/LRoLTlK.jpeg")
journal2.photos.attach(io: file, filename: 'journal.jpg', content_type: 'image/jpg')

journal3 = JournalEntry.create(
  name: Faker::Lorem.sentence(word_count: 2),
  content: Faker::JapaneseMedia::StudioGhibli.quote
)
# file = URI.open("https://i.imgur.com/xBntSnV.jpeg")
# journal3.photos.attach(io: file, filename: 'journal.jpg', content_type: 'image/jpg')

puts "saving journals..."

journal1.save
journal2.save
journal3.save

# miel = Pet.create!(
#   name: "Miel",
#   description: "Miichan is the cutest kitty ever. I wub her so so much ♥ ♥ ♥",
#   age: 2,
#   weight: 7,
#   chip_number: "LW123"
#   )

# puts "creating family"

# Ownership.create!(user: nicole, pet: miel)



# pets = [
#   {
#     name: "Miel",
#     description: "Miichan is the cutest kitty ever. I wub her so so much ♥ ♥ ♥",
#     age: 2,
#     weight: 7,
#     chip_number: "LW123",
#     url: ""
#   },

#   {
#     name: "TJ",
#     description: "Tyler Jr is my favoritest thing in the entire world. He protects me when I'm scared of the clown that lives under my bed.",
#     age: 8,
#     weight: 20,
#     chip_number: "LW456",
#     url: ""
#   },

#   {
#     name: "Shitzu",
#     description: "I went to a zoo and they only had one dog there. It was a...",
#     weight: 2,
#     url: ""
#   },

#   {
#     name: "Basura",
#     description: "I don't even like it. Hamtaro looking ass",
#     age: 1,
#     weight: 1,
#     url: ""
#   },

#   {
#     name: "Catapult",
#     description: "She likes flying through the air.",
#     age: 5,
#     weight: 5,
#     chip_number: "LW789",
#     url: ""
#   },

#   {
#     name: "Doggobot",
#     description: "Why does he have such cold dead eyes...",
#     chip_number: "LW848",
#     url: ""
#   },

#   {
#     name: "Miel",
#     description: "Miichan is the cutest doggo ever. I wub him so so much ♥ ♥ ♥",
#     age: 7,
#     weight: 14,
#     chip_number: "LW484",
#     url: ""
#   },

#   {
#     name: "Valkyrie",
#     description: "This cat is lowkey evil",
#     age: 6,
#     weight: 10,
#     url: ""
#   }
# ]

# i = 1
# pets.each do |pet_info|
#   pet = Pet.new(
#     name: pet_info[:name],
#     description: pet_info[:description],
#     age: pet_info[:age],
#     weight: pet_info[:weight],
#     user: pet_info[:user],
#     chip_number: pet_info[:chip_number]
#   )

#   puts "getting photo for pets..."
#   downloaded_image = URI.open(pet_info[:url])
#   pet.photo.attach(io: downloaded_image, filename: "pet#{i}.png", content_type: "image/png")
#   i += 1
#   if pet.save
#     puts "#{pet.name} was saved!"
#   else
#     p pet.errors.messages
#   end

#   puts "Seeded successfully!"

# end
