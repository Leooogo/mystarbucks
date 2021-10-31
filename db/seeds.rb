# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts "Cleaning database..."
User.destroy_all
Drink.destroy_all

puts "Creating a user..."
user = User.new
user.email = "leo.j.developer@gmail.com"
user.password = "Wkddhkdrnf@2"
user.password_confirmation = 'Wkddhkdrnf@2'
user.save!

drink_attributes = [
  { name: "Iced Cappuccino", size: "Tall", ice: "Regular", flavours: "2 pumps Vanilla Syrup", shot: "2 Shots", rating: "3" },
  { name: "Cappuccino", size: "Tall", flavours: "3 pumps Cinnamon Dolce Syrup", milk: "Whole Milk", shot: "2 Shots", toppings: "Chocolate Powder", rating: "5" },
  { name: "Iced White Chocolate Mocha", size: "Tall", ice: "Regular", flavours: "3 pumps White chocolate Mocha Sauce", milk: "Coconut", shot: "2 Shots", toppings: "No Whipped Cream", rating: "5" },
  { name: "Cookies & Cream Frappuccino", size: "Tall", ice: "Regular", flavours: "3 pumps White chocolate Mocha Sauce", milk: "Whole Milk", toppings: "No Whipped Cream", rating: "5" },
  { name: "Chai Latte", size: "Tall", flavours: "3 pumps White chocolate Mocha Sauce", milk: "Skimmed Milk", shot: "1 Shot", rating: "5" }
]

# drink_attributes.each do |drink_attribute|
#   drink = Drink.create!(drink_attribute)
#   puts "Created #{drink.size}"
# end

drink_attributes.each do |drink_attribute|
  drink = Drink.new(drink_attribute)
  drink.save!
end

puts "Created 1 user"
puts "Created 5 drink"