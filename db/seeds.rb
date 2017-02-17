# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all

User.create!(email:'maxime-dupont@gmail.com', password:'123456', nickname:'Max')
User.create!(email:'jeannot-dupont@gmail.com', password:'123456', nickname:'Jean')


 Artwork.create!(name: 'Joconde', artist_name: 'Vinci', category: 'Painting', price: 1000, dimensions: '10x10', photo: 'http://lorempixel.com/400/200/', user_id: User.first.id)
