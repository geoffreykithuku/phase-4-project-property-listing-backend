# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Seeding Owners...."


Owner.create!([
    {name: "Owen", email: "owne@gmail.com", password:"owen"},
    {name: "Samantha", email: "sam@gmail.com",password:"samantha"},
    {name: "JaneDoe",email:"janedoe@gmail.com", password:"jane"},
    {name: "Owen", email: "oe@gmail.com", password:"owen"},
    {name: "Mark", email: "mark@gmail.com",password:"owen"}])


puts "Seeding Users"

User.create!([{username: Faker::Name.name, email: "airtrace@snakebutt.com"},
    {username: Faker::Name.name, email: "cottonmerely@lilspam.com"},
    {username: Faker::Name.name , email:"casemeant@chewydonut.com"}])


puts "Done Seeing Users"


puts "Seeding Properties"


Property.create!([{owner_id: Owner.first.id,location: Faker::Address.street_address,description:"2 Bed House With Garden In Karen",price:2500000,image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgYzJvMy9qE2q2f7_VO8RLhpQe-NJb48p4ue9wWWcx&s"},
    {owner_id: Owner.second.id,location:Faker::Address.street_address,description:"2 Bed House With Backup Generator",price:3000000,image:"https://media.gettyimages.com/id/183881669/photo/house.jpg?s=612x612&w=gi&k=20&c=vKx9LMH3qNa5n2dLSba8LPjZaSVNwuRDD7B1wisItYU="},
    {owner_id:Owner.last.id,location:Faker::Address.street_address,description:"2 Bed House With En Suite",price:1000000,image:"https://cdn.pixabay.com/photo/2016/06/24/10/47/house-1477041__340.jpg"}])


puts "Done Seeding Properties"



puts "Seeding Reviews"

Review.create!([
    {property_id:Property.last.id,user_id:User.first.id, description: "I love this one and i want it"},
    {property_id:Property.third.id,user_id:User.second.id, description: "Such a beautiful scenery.Completely in love with it"},
    {property_id: Property.first.id,user_id: User.last.id,description: "Great environment, professional and nice people, clean and beautiful office set up"},
    {property_id: Property.last.id,user_id: User.second.id,description: "excellent transport links and a peaceful, quiet environment."},
    {property_id: Property.second.id,user_id: User.last.id,description: "superb design of the houses and their high-quality fittings"}])

puts "Done seeding Reviews"


puts "Done with all Seeding"