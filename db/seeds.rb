# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gallery = Profile.create(name: "Farleys", style: "Coffeeshop", profile_type: "gallery",description: "great coffeshop")
artist = Profile.create(name: "Pablo Picasso", style: "Cubism", profile_type: "artists",description: "amazing artist")
photo = artist.photos.create(title: "superb painting", price: 200, description: "Awesome painting", order:1)
Showing.create(artist_id: artist.id, gallery_id: gallery.id, photo_id: photo.id, description:"new showing")
User.create(first_name:"Pablo",last_name:"Picasso",email:"pp@gmail.com",password:"swordfish")
