desc "Heroku scheduler add-on"
task :update_usne => :environment do
  puts "Updating US Northeast weather suggestions..."
    suggestion = Suggestion.find_or_create_by(region: "usne")
    suggestion.cities.clear
    suggestion.get_cities
    suggestion.save
  puts "done."
end

# task :send_reminders => :environment do
#   User.send_reminders
# end
