# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create user 1
user1 = User.create(name: "Princess Leia", email: "test@example.com", address: "Test Street", city: "Test City", state: "Test state")

# attach active storage avatar from aws to user 1
user1.avatar.attach{
  io: File.open('https://s3-ap-southeast-2.amazonaws.com/rails-preloved/icon1.png'),
    filename: 'icon1.png'
}

# create listing 1 to user 1
listing1 = Listing.create(name: "Violin", description: "Stain on back of violin. No longer played, left behind on a plane and unclaimed in the airport. Almost free to a good home.", condition: 3, instrument_type: "String", price: 100, year: 1990, user_id: 1)

# attach active storage image from aws to listing 1
listing1.image.attach(
    io: File.open('https://s3-ap-southeast-2.amazonaws.com/rails-preloved/violin1.jpg'),
    filename: 'violin1.jpg'
  )