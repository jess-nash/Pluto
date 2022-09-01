namespace :pet do
  desc "TODO"
  task :meals_message, [:pet_id] => :environment do |t, args|
    pet = Pet.find(args[:pet_id])
    pet.send_meal_message
  end

end

# noglob rails pet:meals_message[11]
# RUN IN TERMINAL
# MAKE SURE TO GET THE PET ID AS AN ARGUMENT
