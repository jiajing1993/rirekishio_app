# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin
User.create!(email: "admin@admin.admin",
             password: "1;r2;r3;r777",
             password_confirmation: "1;r2;r3;r777",
             admin: true,
             confirmed_at: Time.zone.now)

# First Ten Fake User
10.times do |n|
  email = "cus#{n+1}@test.org"
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               confirmed_at: Time.zone.now)
end
