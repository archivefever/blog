require 'faker'

names = []
until names.length == 30
  name = Faker::StarWars.character
  name.delete! "\s\n"
  names << name unless names.include?(name)
end

30.times do |n|
User.create(
  username: names[n],
  email: Faker::Internet.safe_email(names[n]),
  password: "password"
  )
end

150.times do
  Post.create!(
    title: Faker::StarWars.quote,
    body: Faker::Hipster.paragraph(5),
    user_id: rand(1..30)
    )
end

300.times do
  Comment.create!(
    title: Faker::StarWars.specie,
    body: Faker::StarWars.wookiee_sentence,
    user_id: rand(1..30),
    post_id: rand(1..150)
    )
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
