# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
    User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password",
      company: " ",
      address: Faker::Lorem.paragraph
      role: rand(1..3),
      cv: Faker::Lorem.paragraph
    )

    users = User.all
    
    users.each do |user|
        5.times do
          user.posts.create(
            title: Faker::Lorem.sentence,
            body: Faker::Lorem.paragraph,
          )
        end
      end
      
  end
  