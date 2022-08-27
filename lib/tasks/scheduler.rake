desc "This task is called by the Heroku scheduler add-on"
task :send_morning_notification => :environment do
  puts "Sending morning notification..."
    LinebotAppointmentJob.new.perform_now
  puts "done."
end
