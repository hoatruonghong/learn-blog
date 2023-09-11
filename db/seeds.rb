# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = User.create([{name:"Admin", email: "admin@gmail.com"}, {name:"Nam", email: "nam@gmail.com"}])
microposts = Micropost.create([{content:"this is a micropost", user_id:users.first.id}])
comments = Comment.create([{content: "very good", user_id: users.first.id, micropost_id: microposts.first.id}])