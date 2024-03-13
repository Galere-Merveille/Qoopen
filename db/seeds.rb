# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all if Rails.env.development?
Space.destroy_all if Rails.env.development?

user1 = User.new(email: "toto@gmail.com", password: "azerty")
user1.save!

Space.create!(city: "Marseille" , address: "21 rue Haxo", space_profession: "Esthétique", description: "Salon de coiffure", price_per_day: 10, price_per_week: 50, price_per_month: 400, user_id: user1.id)
