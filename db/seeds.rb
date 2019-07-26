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

# Template
template_names = ['default']
template_names.each do |name|
  Template.create! name: name,
    content: File.read('app/views/templates/source/_' + name + '.html.slim')
end

#Profile
10.times do |n|
  user_id = n + 2
  name = Faker::Name.name
  email = User.find(user_id).email
  phone_number = rand(100000000).to_s
  current_role = Faker::Job.title
  career_goal = "Further enhance food picking skills."
  skills = [
    { proficiency: "beginner", skills: Faker::Job.key_skill , description: Faker::Lorem.sentence(10) },
    { proficiency: "intermediate", skills: Faker::Job.key_skill , description: Faker::Lorem.sentence(10) }
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

# Showcase profile used by admin
Profile.create! user_id: User.find_by(email: "admin@admin.admin").id,
  name: "Example Name",
  email: "example@email.org",
  phone_number: "012-345 6789",
  current_role: "Current Role",
  career_goal: "An introduction paragraph, who are you, what motivates you and what are you looking for.",
  skills_attributes: [
    {
      proficiency: "basic",
      skills: "Skills #1",
      description: "Detailed explanation on the level of proficiency of Skills #1"
    },
    {
      proficiency: "intermediate",
      skills: "Skills #2",
      description: "Detailed explanation on the level of proficiency of Skills #2"
    },
    {
      proficiency: "advanced",
      skills: "Skills #3",
      description: "Detailed explanation on the level of proficiency of Skills #3"
    }
  ],
  work_experiences_attributes: [
    {
      company: "Name of Company #1",
      city: "City#1",
      description: "Detailed description about the work you did there.",
      start_date: Date.new(2001, 2, 1),
      end_date: Date.new(2002, 1, 1),
      role: "Role #1"
    },
    {
      company: "Name of Company #2",
      city: "City#1",
      description: "Detailed description about the work you did there.",
      start_date: Date.new(2002, 2, 1),
      end_date: Date.new(2003, 1, 1),
      role: "Role #2"
    },
    {
      company: "Name of Company #3",
      city: "City#1",
      description: "Detailed description about the work you did there.",
      start_date: Date.new(2003, 2, 1),
      end_date: Date.new(2004, 1, 1),
      role: "Role #3"
    }
  ],
  education_backgrounds_attributes: [
    {
      university: "Name of University #1",
      major: "Major #1",
      graduation_date: Date.new(1996, 1,1)
    },
    {
      university: "Name of University #2",
      major: "Major #2",
      graduation_date: Date.new(2001, 1,1)
    }
  ],
  project_experiences_attributes: [
    {
      name: "Project #1",
      link: "Link #1",
      description: "Detailed explanation on project #1 and your role in it"
    },
    {
      name: "Project #2",
      link: "Link #2",
      description: "Detailed explanation on project #2 and your role in it"
    },
    {
      name: "Project #3",
      link: "Link #3",
      description: "Detailed explanation on project #3 and your role in it"
    }
  ]
