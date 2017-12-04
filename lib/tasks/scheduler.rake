desc "Heroku scheduler add-on"
task :update_usne => :environment do
  puts "Updating US Northeast weather suggestions..."
    suggestion = Suggestion.find_or_create_by(region: "usne")
    suggestion.cities.clear
    suggestion.get_cities
    suggestion.save
  puts "done."
end

desc "Heroku scheduler add-on"
task :update_usnw => :environment do
  puts "Updating US Northwest weather suggestions..."
    suggestion = Suggestion.find_or_create_by(region: "usnw")
    suggestion.cities.clear
    suggestion.get_cities
    suggestion.save
  puts "done."
end

desc "Heroku scheduler add-on"
task :update_cane => :environment do
  puts "Updating CA Northeast weather suggestions..."
    suggestion = Suggestion.find_or_create_by(region: "cane")
    suggestion.cities.clear
    suggestion.get_cities
    suggestion.save
  puts "done."
end

desc "Heroku scheduler add-on"
task :update_canw => :environment do
  puts "Updating CS Northwest weather suggestions..."
    suggestion = Suggestion.find_or_create_by(region: "canw")
    suggestion.cities.clear
    suggestion.get_cities
    suggestion.save
  puts "done."
end
