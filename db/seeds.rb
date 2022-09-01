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
  static_lineid= "U29fc2d282dce3a16c412ad7c1556725e"

  nicole = User.create(
    name: "Nicole",
    email: "nicole@gmail.com",
    password: password,
    username: "Nicole",
    line_id: static_lineid
  )
  file = URI.open("https://avatars.githubusercontent.com/u/74501096?v=4")
  nicole.photo.attach(io: file, filename: 'nicole.jpg', content_type: 'image/jpg')

  tyler = User.create(
    name: "Tyler",
    email: "tyler@gmail.com",
    password: password,
    username: "Tyler",
    line_id: static_lineid
  )
  file = URI.open("https://avatars.githubusercontent.com/u/101543224?v=4")
  tyler.photo.attach(io: file, filename: 'tyler.jpg', content_type: 'image/jpg')

  jessica = User.create(
    name: "Jessica",
    email: "jessica@gmail.com",
    password: password,
    username: "Jessica",
    line_id: static_lineid
  )
  file = URI.open("https://avatars.githubusercontent.com/u/97200803?v=4")
  jessica.photo.attach(io: file, filename: 'jess.jpg', content_type: 'image/jpg')

  ken = User.create(
    name: "Ken",
    email: "ken@gmail.com",
    password: password,
    username: "Ken",
    line_id: static_lineid
  )
  file = URI.open("https://avatars.githubusercontent.com/u/100769790?v=4")
  ken.photo.attach(io: file, filename: 'ken.jpg', content_type: 'image/jpg')

  [nicole, tyler, jessica, ken]
end

def create_pets
  pets = [
    {
      name: "Miel",
      description: "Only ever responds to Micchan. Is a calico and siamese mix from Osaka. She has bright blue eyes and loves most humans. Does not like being picked up! Favorite snack is chururu.",
      age: 8,
      weight: 7,
      chip_number: "APTX4869",
      sex: "Female",
      url: "https://i.imgur.com/ry15K1x.jpg"
    },

    {
      name: "TJ",
      description: "Tyler Jr is my favoritest thing in the entire world. He protects me when I'm scared of the clown that lives under my bed.",
      age: 8,
      weight: 20,
      chip_number: "LW456",
      sex: "Male",
      url: "https://images.unsplash.com/photo-1620001796685-adf7110fe1a7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"
    },

    {
      name: "Shitzu",
      description: "I went to a zoo and they only had one dog there. It was a...",
      weight: 2,
      sex: "Male",
      url: "https://images.unsplash.com/photo-1588178393136-4b0950f78c38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80"
    },

    {
      name: "Basura",
      description: "I don't even like it. Hamtaro looking ass",
      age: 1,
      weight: 1,
      sex: "Male",
      url: "https://images.unsplash.com/photo-1425082661705-1834bfd09dca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1476&q=80"
    },

    {
      name: "Catapult",
      description: "She likes flying through the air.",
      age: 5,
      weight: 5,
      chip_number: "LW789",
      sex: "Female",
      url: "https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
    },

    {
      name: "Doggobot",
      description: "Why does he have such cold dead eyes...",
      chip_number: "LW848",
      sex: "Male",
      url: "https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"
    },

    {
      name: "Miel",
      description: "Miichan is the cutest doggo ever. I wub him so so much ♥ ♥ ♥",
      age: 7,
      weight: 14,
      chip_number: "LW484",
      sex: "Male",
      url: "https://images.unsplash.com/photo-1552053831-71594a27632d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=662&q=80"
    },

    {
      name: "Valkyrie",
      description: "This cat is lowkey evil",
      age: 6,
      weight: 10,
      sex: "Female",
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
      chip_number: pet_info[:chip_number],
      sex: pet_info[:sex]
    )
    downloaded_image = URI.open(pet_info[:url])
    pet_instances.last.photo.attach(io: downloaded_image, filename: "pet#{i}.png", content_type: "image/png")
    i += 1
  end
  pet_instances
end

def create_ownerships(users, pets)
  pets.each_slice(2).with_index do |(pet_1, pet_2), i|
    Ownership.create(user: users[i], pet: pet_1, main: true)
    Ownership.create(user: users[i], pet: pet_2, main: true)
  end
end

def create_journals
  journal1 = JournalEntry.create!(
    name: "Battled the Vaccuum Cleaner",
    content: "The vacuum cleaner Ken bought yesterday seemed to boil up some sort of hidden rage for #{Pet.last.name}. I hope it lasts...",
    pet: Pet.last,
    user: User.first
  )
  file = URI.open("https://img-9gag-fun.9cache.com/photo/a1rEV2R_460swp.jpg")
  journal1.photos.attach(io: file, filename: 'journal.jpg', content_type: 'image/jpg')

  journal2 = JournalEntry.create!(
    name: "Paint me like one of your French Pets",
    content: "#{Pet.first.name} is definitely one of the sweetest pets I've pet-sitted for. And to be honest, she's a bit of a supermodel.",
    pet: Pet.first,
    user: User.last
  )
  file = URI.open("https://i.imgur.com/9WaaESN.jpg")
  journal2.photos.attach(io: file, filename: 'journal.jpg', content_type: 'image/jpg')

  journal3 = JournalEntry.create!(
    name: "Cuddling up on the couch",
    content: "This is her new most favorite place to sleep and its absolutely adorable. Sometimes I cuddle up with her.",
    pet: Pet.first,
    user: User.first
  )
  file = URI.open("https://i.imgur.com/QNwnSXy.jpg")
  journal3.photos.attach(io: file, filename: 'journal.jpg', content_type: 'image/jpg')
end

def create_appointments
   apt1 = Appointment.create(
    name: "Annual checkup",
    description: "Just our yearly checkup to make sure my baby is healthy. Wanted to make sure we are meeting our weight goals for this year as well.",
    appointment_type: "checkup",
    time: Faker::Time.between_dates(from: Date.today - (rand * 30), to: Date.today, period: :day).at_beginning_of_hour,
    location: Faker::Address.full_address,
    pet: Pet.first
  )
  file = URI.open("https://wgme.com/resources/media2/16x9/full/1015/center/80/af3bde07-4879-48d9-be20-62fc30332bbf-large16x9_fakevaccinedoc.jpg")
  apt1.photos.attach(io: file, filename: 'appointment.jpg', content_type: 'image/jpg')

  apt2 = Appointment.create(
    name: "Teeth cleaning",
    description: "Monthly teeth cleaning and reminder to tell vet that her other vet said my baby should have all their teeth removed by next year.",
    appointment_type: "checkup",
    time: Faker::Time.between_dates(from: Date.today + (rand * 30), to: Date.today, period: :day).at_beginning_of_hour,
    location: Faker::Address.full_address,
    pet: Pet.second
  )
  file = URI.open("https://images.squarespace-cdn.com/content/v1/5b8b5ec92714e5fbeb8d0846/1579627917903-7THOO6QN86AAJE17II1O/IMG_2814.jpg")
  apt2.photos.attach(io: file, filename: 'appointment.jpg', content_type: 'image/jpg')

  apt3 = Appointment.create(
    name: "Rabies vaccine",
    description: "Don’t forget to bring in the medical forms for immigration so my baby can go home with me! Ask if there’s any other vaccines recommended for pet travel.",
    appointment_type: "vaccine",
    time: Faker::Time.between_dates(from: Date.today - (rand * 30), to: Date.today, period: :day).at_beginning_of_hour,
    location: Faker::Address.full_address,
    pet: Pet.third
  )
  file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJbXH7XUJnIsNeOXLKk2BkRqmYZXPptBuBAJnmTFb2I_BGyp6uY4YBtGanak-EZGCvZ50&usqp=CAU")
  apt3.photos.attach(io: file, filename: 'appointment.jpg', content_type: 'image/jpg')

  apt4 = Appointment.create(
    name: "Ear infection visit",
    description: "It looks like baby’s ear is very inflamed??? It’s very red and they keep scratching it. Baby had an infection last year I’m worried it came back.",
    appointment_type: "concern",
    time: Faker::Time.between_dates(from: Date.today + (rand * 30), to: Date.today, period: :day).at_beginning_of_hour,
    location: Faker::Address.full_address,
    pet: Pet.fourth
  )
  file = URI.open("https://preview.redd.it/lld5rmounr651.jpg?width=640&crop=smart&auto=webp&s=0aecfc140f2f57671816e1baa9b24b9aff5950a7")
  apt4.photos.attach(io: file, filename: 'appointment.jpg', content_type: 'image/jpg')

  apt5 = Appointment.create(
    name: "Annual checkup",
    description: "Just our yearly checkup to make sure my baby is healthy. They’ve haven’t a lot of an appetite lately so ask the doctor about it.",
    appointment_type: "checkup",
    time: Faker::Time.between_dates(from: Date.today - (rand * 30), to: Date.today, period: :day).at_beginning_of_hour,
    location: Faker::Address.full_address,
    pet: Pet.fifth
  )
  file = URI.open("https://cdn0.opinion-corp.com/review-media/pictures/4c/b2/261022/vetco-clinics_they-messed-up-my-records-201801291178621_4cb2-medium.jpeg")
  apt5.photos.attach(io: file, filename: 'appointment.jpg', content_type: 'image/jpg')

  apt6 = Appointment.create(
    name: "Vaccines",
    description: "Get doctor to sign necessary vaccination documents so we can fly home together in the fall! Don’t forget!!!",
    appointment_type: "vaccine",
    time: Faker::Time.between_dates(from: Date.today + (rand * 30), to: Date.today, period: :day).at_beginning_of_hour,
    location: Faker::Address.full_address,
    pet: Pet.fifth
  )
  file = URI.open("http://brewermaine.gov/wp-content/uploads/2017/01/Vet.jpg")
  apt6.photos.attach(io: file, filename: 'appointment.jpg', content_type: 'image/jpg')

  apt7 = Appointment.create(
    name: "Nose rash",
    description: "This keeps coming back?? I used the cream the doctor gave me and it’ll go away for a hot second and then come back days later. Maybe he can help me find the underlying reason??",
    appointment_type: "concern",
    time: Faker::Time.between_dates(from: Date.today - (rand * 30), to: Date.today, period: :day).at_beginning_of_hour,
    location: Faker::Address.full_address,
    pet: Pet.last
  )
  file = URI.open("https://www.dogjaunt.com/files/2014/11/IMG_3786-6-375x500.jpg")
  apt7.photos.attach(io: file, filename: 'appointment.jpg', content_type: 'image/jpg')

  apt8 = Appointment.create(
    name: "Biting paw",
    description: "I really don’t know what’s going on. They’ve also been biting my elbows lately? Does the doctor recommend an increase in snacks and cuddles?",
    appointment_type: "concern",
    time: Faker::Time.between_dates(from: Date.today + (rand * 30), to: Date.today, period: :day).at_beginning_of_hour,
    location: Faker::Address.full_address,
    pet: Pet.last
  )
  file = URI.open("https://live.staticflickr.com/6055/6301607331_5f1f8674d4_b.jpg")
  apt8.photos.attach(io: file, filename: 'appointment.jpg', content_type: 'image/jpg')
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
      name: "IAMS proactive health",
      meal_type: "Dry food",
      description: "For urinary tract health. As per doctor's recommendation",
      serving_size: "50 grams",
      time: ["Breakfast", "Lunch"],
      url: "https://photos-us.bazaarvoice.com/photo/2/cGhvdG86aWFtcy1jYQ/0576a15a-9b2e-50fe-b81d-93abfe740794"
    },

    {
      name: "Milk-Bone Grain Free biscuits",
      meal_type: "Dry food",
      description: "Le Wagon's signature treat for your pet",
      serving_size: "1-2 sticks",
      time: ["Snack"],
      url: "https://assets.petco.com/petco/image/upload/f_auto,q_auto/3121027-center-1"
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
      name: "Pure - White mill",
      meal_type: "Dry food",
      description: "He really loves this stuff and no artificial fragrances, colors or flavors. So healthy!",
      serving_size: "30 g",
      time: ["Lunch", "Dinner"],
      url: "https://photos-us.bazaarvoice.com/photo/2/cGhvdG86cGV0Y28/675e6c2d-c36e-57f3-b6c3-06c750b2557b"
    },

    {
      name: "Homemade treat",
      meal_type: "Dry food",
      description: "Ingredients: 2 cups water, 1 egg, 1 Tablespoon Catnip, 2 cups dry cat food. Blend ingredients, and divide into small balls and bake for 15 min.",
      serving_size: "1 treat",
      time: ["Snack"],
      url: "https://healthhomeandhappiness.com/wp-content/uploads/2020/01/Homemade-kitten-food-frozen-338x450.jpg"
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
      name: "Jerky strips",
      meal_type: "Dry food",
      description: "grass fed bison jerky-- protein, grain free jerky treats",
      serving_size: "1 jerky",
      time: ["Snack"],
      url: "https://seattlebackpackersmagazine.com/wp-content/uploads/2019/09/Only-Natural-Pet-Jerky-Strips-Dog-Treat-Natural-Grain-Free-Bison-Bag-415x600.jpg"
    },

    {
      name: "Healthy Pet - cold",
      meal_type: "Dry food",
      description: "This is the food that she has liked the most since the start of the diet!",
      serving_size: "50g",
      time: ["Lunch", "Dinner"],
      url: "https://cf.shopee.co.id/file/8cad35d5da1d44b2cfd831761f8c4f91"
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
