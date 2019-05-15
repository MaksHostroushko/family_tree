# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'makshostroyshko@gmail.com', password: 'qwerty', password_confirmation: 'qwerty') if Rails.env.development?
#
10.times do
  Relative.create!(first_name: Faker::Name.first_name, second_name: Faker::Name.last_name , born: '05/14/1998', description: Faker::TvShows::Simpsons.quote, user_id: 10)
end

20.times do
  User.create!(name: Faker::Name.first_name, second_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'qwerty', password_confirmation: 'qwerty', provider: nil, uid: nil)
end

10.times do
  Category.create!(name: Faker::Coffee.variety, user_id: 10)
end
