# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "Heroku scheduler add-on"
task :update_usne => :environment do
  puts "Updating US Northeast weather suggestions..."
    suggestion = Suggestion.find_or_create_by(region: "usne")
    suggestion.cities.clear
    suggestion.get_cities
    suggestion.save
  puts "done."
end
