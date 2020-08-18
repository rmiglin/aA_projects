# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: 'catherine_is_cooler_than_ross')
user2 = User.create(username: 'ross_the_terrible')
user3 = User.create(username: 'alvin4life')
artwork1 = Artwork.create(title: 'Catherine at Dusk', image_url: '/dusky_catherine', artist_id: 1)
artwork2 = Artwork.create(title: 'Ross Rides Dinosaur', image_url: '/dino_ride', artist_id: 2)
artwork3 = Artwork.create(title: 'Alvin With a Pearl Earring', image_url: '/alvin_with_earring', artist_id: 3)
artwork4 = Artwork.create(title: 'Ross\' Untimely Demise', image_url: '/ross_defeated', artist_id: 2)
artwork5 = Artwork.create(title: 'The Persistence of Alvinry', image_url: '/avlin_melted_watch', artist_id: 3)
artwork6 = Artwork.create(title: 'Catherine\'s Coronation', image_url: '/catherine_coronation', artist_id: 1)
artwork_share1 = ArtworkShare.create(artwork_id: 1, viewer_id: 2)
artwork_share2 = ArtworkShare.create(artwork_id: 2, viewer_id: 3)
artwork_share3 = ArtworkShare.create(artwork_id: 5, viewer_id: 2)
artwork_share4 = ArtworkShare.create(artwork_id: 6, viewer_id: 1)
