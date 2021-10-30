# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "Cleaning database..."
User.destroy_all

puts "Creating a user..."
user = User.new
user.email = "leo.j.developer@gmail.com"
user.password = "Wkddhkdrnf@2"
user.password_confirmation = 'Wkddhkdrnf@2'
user.save!

# drink_attributes = [
#   { size: "Short" },
#   { size: "Tall" },
#   { size: "Grande" },
#   { size: "Venti" }
# ]

# drink_attributes.each do |drink_attribute|
#   drink = Drink.create!(drink_attribute)
#   puts "Created #{drink.size}"
# end

# drink_attributes.each do |drink_attribute|
#   drink = Drink.new(drink_attribute)
#   drink.save!
# end

puts "Created 1 user"
# puts "Created 4 drink size"