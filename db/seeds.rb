require 'open-uri'

puts "cleaning database..."
Ownership.destroy_all
JournalEntry.destroy_all
Appointment.destroy_all
Medicine.destroy_all
Meal.destroy_all
Pet.destroy_all
User.destroy_all

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
      url: "https://images.unsplash.com/photo-1618826411640-d6df44dd3f7a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
    },

    {
      name: "TJ",
      description: "Tyler Jr is my favoritest thing in the entire world. He protects me when I'm scared of the clown that lives under my bed.",
      age: 8,
      weight: 20,
      chip_number: "LW456",
      url: "https://images.unsplash.com/photo-1620001796685-adf7110fe1a7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"
    },

    {
      name: "Shitzu",
      description: "I went to a zoo and they only had one dog there. It was a...",
      weight: 2,
      url: "https://images.unsplash.com/photo-1588178393136-4b0950f78c38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80"
    },

    {
      name: "Basura",
      description: "I don't even like it. Hamtaro looking ass",
      age: 1,
      weight: 1,
      url: "https://images.unsplash.com/photo-1425082661705-1834bfd09dca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1476&q=80"
    },

    {
      name: "Catapult",
      description: "She likes flying through the air.",
      age: 5,
      weight: 5,
      chip_number: "LW789",
      url: "https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
    },

    {
      name: "Doggobot",
      description: "Why does he have such cold dead eyes...",
      chip_number: "LW848",
      url: "https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"
    },

    {
      name: "Miel",
      description: "Miichan is the cutest doggo ever. I wub him so so much ♥ ♥ ♥",
      age: 7,
      weight: 14,
      chip_number: "LW484",
      url: "https://images.unsplash.com/photo-1552053831-71594a27632d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=662&q=80"
    },

    {
      name: "Valkyrie",
      description: "This cat is lowkey evil",
      age: 6,
      weight: 10,
      url: "https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=749&q=80"
    }
  ]

  pet_instances = []
  i = 1
  pets.each do |pet_info|
    pet_instances << Pet.create!(
      name: pet_info[:name],
      description: pet_info[:description],
      age: pet_info[:age],
      weight: pet_info[:weight],
      chip_number: pet_info[:chip_number]
    )
    downloaded_image = URI.open(pet_info[:url])
    pet_instances.last.photo.attach(io: downloaded_image, filename: "pet#{i}.png", content_type: "image/png")
    i += 1
  end
  pet_instances
end

def create_ownerships(users, pets)
  pets.each_slice(2).with_index do |(pet_1, pet_2), i|
    Ownership.create(user: users[i], pet: pet_1)
    Ownership.create(user: users[i], pet: pet_2)
  end
end

def create_journals
  journal1 = JournalEntry.create(
    name: Faker::Lorem.sentence(word_count: 3),
    content: Faker::JapaneseMedia::StudioGhibli.quote,
    pet: Pet.last
  )
  file = URI.open("https://api.kyivindependent.com/storage/2021/12/loveyoustepan.-instagram-1024x683.jpg")
  journal1.photos.attach(io: file, filename: 'journal.jpg', content_type: 'image/jpg')

  journal2 = JournalEntry.create(
    name: Faker::Lorem.sentence(word_count: 5),
    content: Faker::JapaneseMedia::StudioGhibli.quote,
    pet: Pet.first
  )
  file = URI.open("https://i.imgur.com/LRoLTlK.jpeg")
  journal2.photos.attach(io: file, filename: 'journal.jpg', content_type: 'image/jpg')

  journal3 = JournalEntry.create(
    name: Faker::Lorem.sentence(word_count: 2),
    content: Faker::JapaneseMedia::StudioGhibli.quote,
    pet: Pet.first
  )
  file = URI.open("https://i.imgur.com/xBntSnV.jpeg")
  journal3.photos.attach(io: file, filename: 'journal.jpg', content_type: 'image/jpg')
end

def create_appointments
  Appointment.create(
    name: "Annual checkup",
    description: "just our yearly checkup to make sure my baby is healthy",
    appointment_type: "checkup",
    time: DateTime.now + [*-30..30].sample,
    location: Faker::Address.full_address,
    pet: Pet.all.sample
  )

  Appointment.create(
    name: "Teeth cleaning",
    description: "get them teeth all shiny!",
    appointment_type: "checkup",
    time: DateTime.now + [*-30..30].sample,
    location: Faker::Address.full_address,
    pet: Pet.all.sample
  )

  Appointment.create(
    name: "rabies vaccine",
    description: "",
    appointment_type: "vaccine",
    time: DateTime.now + [*-30..30].sample,
    location: Faker::Address.full_address,
    pet: Pet.all.sample
  )

  Appointment.create(
    name: "ear infection visit",
    description: "",
    appointment_type: "",
    time: DateTime.now + [*-30..30].sample,
    location: Faker::Address.full_address,
    pet: Pet.all.sample
  )

  Appointment.create(
    name: "annual checkup",
    description: "",
    appointment_type: "checkup",
    time: DateTime.now + [*-30..30].sample,
    location: Faker::Address.full_address,
    pet: Pet.all.sample
  )

  Appointment.create(
    name: "vaccines",
    description: "",
    appointment_type: "vaccine",
    time: DateTime.now + [*-30..30].sample,
    location: Faker::Address.full_address,
    pet: Pet.all.sample
  )
end

def create_medicine
  ivermectin = Medicine.create(
    name: "ivermectin",
    dosage: "3 spoonfuls",
    medicine_type: "liquid",
    start_date: Faker::Date.forward(days: 1),
    end_date: Faker::Date.forward(days: 7),
    expiration_date: Faker::Date.forward(days: 250),
    description: "if its good enough for trump, its good enough for my pet",
    important: true,
    pet: Pet.all.sample
  )
  file = URI.open("https://cloudfront-us-east-1.images.arcpublishing.com/advancelocal/NG7EXYYOKZFQXDCAWUBFMETMTA.jpg")
  ivermectin.photos.attach(io: file, filename: 'medicine.jpg', content_type: 'image/jpg')

  antibiotics = Medicine.create(
    name: "Ashmore antibiotics",
    dosage: "2 daily",
    medicine_type: "pills",
    start_date: Faker::Date.forward(days: 1),
    end_date: Faker::Date.forward(days: 7),
    expiration_date: Faker::Date.forward(days: 250),
    description: "I trust Ashmore big pharma",
    important: false,
    pet: Pet.all.sample
  )
  file = URI.open("https://media.wbur.org/wp/2019/11/AP_110513055670-1000x722.jpg")
  antibiotics.photos.attach(io: file, filename: 'medicine.jpg', content_type: 'image/jpg')

  dewormer = Medicine.create(
    name: "Ashmore dewormer",
    dosage: "3 daily",
    medicine_type: "pills",
    start_date: Faker::Date.forward(days: 1),
    end_date: Faker::Date.forward(days: 7),
    expiration_date: Faker::Date.forward(days: 250),
    description: "Make sure to mix with food",
    important: false,
    pet: Pet.all.sample
  )
  file = URI.open("https://media.wbur.org/wp/2019/11/AP_110513055670-1000x722.jpg")
  dewormer.photos.attach(io: file, filename: 'medicine.jpg', content_type: 'image/jpg')

  apoquel = Medicine.create(
    name: "Apoquel",
    dosage: "1 at breakfast",
    medicine_type: "pill",
    start_date: Faker::Date.forward(days: 1),
    end_date: Faker::Date.forward(days: 7),
    expiration_date: Faker::Date.forward(days: 250),
    description: "This pill helps with indigestion",
    important: false,
    pet: Pet.all.sample
  )
  file = URI.open("https://5.imimg.com/data5/SELLER/Default/2022/1/WF/SH/CH/71146/apoquel-oclacitinib-tablets-for-dogs-500x500.jpg")
  apoquel.photos.attach(io: file, filename: 'medicine.jpg', content_type: 'image/jpg')

  nexgard = Medicine.create(
    name: "nexgard",
    dosage: "1 at breakfast",
    medicine_type: "pills",
    start_date: Faker::Date.forward(days: 1),
    end_date: Faker::Date.forward(days: 7),
    expiration_date: Faker::Date.forward(days: 250),
    description: "Flea Fighter! Like the foo fighters but its for the red hot chilli peppers",
    important: false,
    pet: Pet.all.sample
  )
  file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThRZEQumMaYheZ8YHJmHVRcZz1rT5IlWLV4Q&usqp=CAU")
  nexgard.photos.attach(io: file, filename: 'medicine.jpg', content_type: 'image/jpg')

  heartgard = Medicine.create(
    name: "heartgard",
    dosage: "1 in the late afternoon",
    medicine_type: "chewable",
    start_date: Faker::Date.forward(days: 1),
    end_date: Faker::Date.forward(days: 7),
    expiration_date: Faker::Date.forward(days: 250),
    description: "Administer to prevent heartworm disease and control ascarid",
    important: false,
    pet: Pet.all.sample
  )
  file = URI.open("https://cdn.shopify.com/s/files/1/1624/5131/products/Heargard_PLus_Brown_Front.jpg?v=1587522123")
  heartgard.photos.attach(io: file, filename: 'medicine.jpg', content_type: 'image/jpg')

  simparica = Medicine.create(
    name: "simparica",
    dosage: "1 in the late afternoon",
    medicine_type: "chewable",
    start_date: Faker::Date.forward(days: 1),
    end_date: Faker::Date.forward(days: 7),
    expiration_date: Faker::Date.forward(days: 250),
    description: "simp for your pets health. It's worth it.",
    important: false,
    pet: Pet.all.sample
  )
  file = URI.open("https://www.petindiaonline.com/upload_product/1466_18022022060619000000_simparica1.jpg")
  simparica.photos.attach(io: file, filename: 'medicine.jpg', content_type: 'image/jpg')

  bravecto = Medicine.create(
    name: "bravecto",
    dosage: "once every hour from 13:00-18:00",
    medicine_type: "pills",
    start_date: Faker::Date.forward(days: 1),
    end_date: Faker::Date.forward(days: 7),
    expiration_date: Faker::Date.forward(days: 250),
    description: "This medication is a lot of work but is a miracle maker",
    important: false,
    pet: Pet.all.sample
  )
  file = URI.open("https://www.google.com/search?q=bravecto+&tbm=isch&ved=2ahUKEwie78PmtMv5AhV7RvUHHWU8AugQ2-cCegQIABAA&oq=bravecto+&gs_lcp=CgNpbWcQAzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQ6BAgjECdQAFiqDmDXD2gAcAB4AIABnwGIAaEGkgEDOC4xmAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=YJT7Yp6_LPuM1e8P5fiIwA4&bih=625&biw=1024&rlz=1C1CHZN_enJP952JP952#imgrc=_ZIXwMZbdtVb3M")
  bravecto.photos.attach(io: file, filename: 'medicine.jpg', content_type: 'image/jpg')
end

def create_meals
  meals = [
    {
      name: "Petsmile morning cuisine",
      meal_type: "Dry food",
      description: "Chicken flavored. Best given first thing in the morning",
      serving_size: "50 grams",
      time: ["Breakfast", "Lunch"],
      url: "https://images.unsplash.com/photo-1589924691995-400dc9ecc119?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
    },

    {
      name: "BisKitt",
      meal_type: "Dry food",
      description: "Le Wagon's signature treat for your pet",
      serving_size: "1 stick",
      time: ["Snack"],
      url: "https://images.unsplash.com/photo-1592468257342-8375cb556a69?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80"
    },

    {
      name: "Butcher's natural nutrition",
      meal_type: "Wet food",
      description: "Serving size says 20g, but 40 works better",
      serving_size: "20 grams",
      time: ["Lunch"],
      url: "https://images.unsplash.com/photo-1597843786186-826cc3489f56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"
    },

    {
      name: "Steak",
      meal_type: "Dry food",
      description: "Good ol' steak",
      serving_size: "200 g",
      time: ["Lunch", "Dinner"],
      url: "https://images.unsplash.com/photo-1613454320437-0c228c8b1723?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
    },

    {
      name: "Homemade treat",
      meal_type: "Dry food",
      description: "Sugar water flour",
      serving_size: "1 treat",
      time: ["Snack"],
      url: "https://images.unsplash.com/photo-1582798358481-d199fb7347bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
    },

    {
      name: "Yann's Organic pellets",
      meal_type: "Dry food",
      description: "Some energetic Frenchman in a V-neck sold these to me",
      serving_size: "1 pound",
      time: ["Dinner"],
      url: "https://images.unsplash.com/photo-1596854236500-a0b80b17154e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80"
    },

    {
      name: "Yann's Organic pet jerky",
      meal_type: "Dry food",
      description: "Some energetic Frenchman in a V-neck sold this to me",
      serving_size: "2 pieces",
      time: ["Snack"],
      url: "https://images.unsplash.com/photo-1566802516196-1bb541e324e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"
    },

    {
      name: "Pet friendly chips",
      meal_type: "Dry food",
      description: "Little sus but whatever",
      serving_size: "1 pack",
      time: ["Lunch", "Dinner"],
      url: "https://images.unsplash.com/photo-1614633836648-68ddff9f7553?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80"
    }
  ]

  meal_instances = []
  i = 1
  meals.each do |meal_info|
    meal_instances << Meal.new(
      name: meal_info[:name],
      description: meal_info[:description],
      meal_type: meal_info[:meal_type],
      serving_size: meal_info[:serving_size],
      time: meal_info[:time]
    )
    downloaded_image = URI.open(meal_info[:url])
    meal_instances.last.photos.attach(io: downloaded_image, filename: "meal#{i}.png", content_type: "image/png")
    i += 1
  end
  meal_instances
end

def add_meals_to_pets(pets, meals)
  meals.each_with_index do |meal, i|
    meal.pet = pets[i]
    meal.save!
  end
end

puts "Seeding database with Plutonians..."
users = create_users
puts "users created!"

puts "adding pets..."
pets = create_pets
puts "pets created!"

puts "creating family..."
create_ownerships(users, pets)
puts "family created!"

puts "adding journals..."
create_journals
puts "journals created!"

puts "creating appointments for your babies..."
create_appointments
puts "appointments created!"

puts "adding medicine..."
create_medicine
puts "medicine created!"

puts "creating meals"
meals = create_meals
puts "meals created"

puts "adding a meal to a pet"
add_meals_to_pets(pets, meals)
puts "meal added to a pet"

puts "Database complete!"
