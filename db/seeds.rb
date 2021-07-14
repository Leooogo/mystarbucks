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
user.email = "minjeongg24@gmail.com"
user.password = "Wkddhkdrnf@2"
user.password_confirmation = 'Wkddhkdrnf@2'
user.save!

# size_attributes = [
#   { name: "Short" },
#   { name: "Tall" },
#   { name: "Grande" },
#   { name: "Venti" }
# ]

# size_attributes.each do |size_attribute|
#   size = Size.create!(size_attribute)
#   puts "Created #{size.name}"
# end

puts "Created 1 user"