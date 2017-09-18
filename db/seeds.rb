require 'faker'


20.times do
  name = Faker::StarWars.character
User.create!(
  username: name.join(''),
  email: Faker::Internet.safe_email(name.join('')),
  password: "password"
  )
end

100.times do
  Post.create!(
    title: Faker::StarWars.quote,
    body: Faker::Hipster.paragraph(5),
    user_id: rand(1..20)
    )
end

300.times do
  Comment.create!(
    title: Faker::StarWars.specie,
    body: Faker::StarWars.wookiee_sentence,
    user_id: rand(1..20),
    post_id: rand(1..100)
    )
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
