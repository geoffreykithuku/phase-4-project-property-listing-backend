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
    {name: "Owen", email: "owne@gmail.com"},
    {name: "Samantha", email: "sam@gmail.com"},
    {name: "JaneDoe",email:"janedoe@gmail.com"},
    {name: "Owen", email: "owne@gmail.com"},
    {name: "Mark", email: "mark@gmail.com"}])

puts "Done seeding Owners"

puts "Seeding Users"
User.create!([
    {username: Faker::Name.name, email: "airtrace@snakebutt.com"},
    {username: Faker::Name.name, email: "cottonmerely@lilspam.com"},
    {username: Faker::Name.name , email:"casemeant@chewydonut.com"},
    {username: Faker::Name.name, email: "casavera@gmail.com"},
    {username: Faker::Name.name,email:"cocoloco@gmail.com"}])

puts "Done Seeing Users"


puts "Seeding Properties"

Property.create!([
    {owner_id:Owner.fourth.id, location: "Parklands", description: "Fully Furnished Four Bedroom Modern Apartment with Scenic Views.", price: 60000, image: "https://i.roamcdn.net/prop/brk/listing-thumb-376w/c90ffbd52b23989635c9e6ae7a888d57/-/prod-property-core-backend-media-brk/4572800/c58e002a-2cb1-43cb-93b8-12098e78d4f0.jpg"},
    {owner_id:Owner.first.id, location: "Lavington", description: "Rustic 4 Bedroom Penthouse For Rent" , price: 250000, image: "https://i.roamcdn.net/prop/brk/listing-thumb-376w/595c6cb5191d1d37904b4f28b13f70a8/-/prod-property-core-backend-media-brk/4586389/6de81fe1-dd1d-46bb-88e7-304791f9b21c.jpg"},
    {owner_id: Owner.third.id,location: "Membley",description:"2 Bed House With Garden In Karen",price:2500000,image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgYzJvMy9qE2q2f7_VO8RLhpQe-NJb48p4ue9wWWcx&s"},
    {owner_id: Owner.second.id,location: "Karen",description:"3 Bed House With Backup Generator",price:3000000,image:"https://media.gettyimages.com/id/183881669/photo/house.jpg?s=612x612&w=gi&k=20&c=vKx9LMH3qNa5n2dLSba8LPjZaSVNwuRDD7B1wisItYU="},
    {owner_id:Owner.last.id,location:"Kitusuru",description:"2 Bed House With En Suite",price:1000000,image:"https://cdn.pixabay.com/photo/2016/06/24/10/47/house-1477041__340.jpg"}])

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