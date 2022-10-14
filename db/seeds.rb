# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p "Seeding database..."

User.create(name: "Sahar Ibnas", email: "sahar@gmail.com", password: "123456", password_confirmation: "123456")
Recipe.create(name: "Pizza", preparation_time: "30 minutes", cooking_time: "30 minutes", description: "This is a pizza recipe", public: true, user_id: 1)
Recipe.create(name: "Burger", preparation_time: "30 minutes", cooking_time: "30 minutes", description: "This is a burger recipe", public: false, user_id: 1)
Recipe.create(name: "Salad", preparation_time: "30 minutes", cooking_time: "30 minutes", description: "This is a salad recipe", public: false, user_id: 2)
p "Created #{User.count} users"
p "Created #{Recipe.count} recipes"
p "Database seeded!"