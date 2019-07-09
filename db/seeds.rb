# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Admin
User.create! email: "admin@admin.admin",
  password: "1;r2;r3;r777",
  password_confirmation: "1;r2;r3;r777",
  admin: true,
  confirmed_at: Time.zone.now

# First Ten Fake User
10.times do |n|
  email = "cus#{n+1}@test.org"
  password = "password"
  User.create! email: email,
    password: password,
    password_confirmation: password,
    confirmed_at: Time.zone.now
end

#Profile
9.times do |n|
  user_id = n + 1
  name = Faker::Name.name
  email = User.find(user_id).email
  phone_number = rand(100000000).to_s
  current_role = Faker::Job.title
  career_goal = "Further enhance food picking skills."
  skills = [
    { proficiency: "low", skills: Faker::Job.key_skill , description: Faker::Lorem.sentence(10) },
    { proficiency: "high", skills: Faker::Job.key_skill , description: Faker::Lorem.sentence(10) }
  ]
  work_experiences = [
    { company: Faker::Company.name,
      role: Faker::Job.title,
      start_date: Faker::Date.between(4.years.ago, 3.years.ago),
      end_date: Faker::Date.between(2.years.ago, 1.years.ago),
      city: Faker::Lorem.word,
      description: Faker::Lorem.sentence(10) }
  ]
  education_backgrounds = [
    { university: Faker::University.name, major: Faker::Lorem.word, graduation_date: Faker::Date.between(5.years.ago, 4.years.ago) }
  ]
  project_experiences = [
    { name: Faker::Lorem.sentence(4), link: "www.tuwdtc.org", description: Faker::Lorem.sentence(10) }
  ]

Profile.create! user_id: user_id,
  name: name,
  email: email,
  phone_number: phone_number,
  current_role: current_role,
  career_goal: career_goal,
  skills_attributes: skills,
  work_experiences_attributes: work_experiences,
  education_backgrounds_attributes: education_backgrounds,
  project_experiences_attributes: project_experiences
end
