# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# natalia.turok1105@gmail.com

%w[перший другий третій четвертий п’ятий шостий сьомий восьмий дев’ятий десятий одинадцятий].each do |i|
  Categgory.find_or_create_by(name: i)
end

@petia_user = User.create_with(full_name: 'Петя Пяточкін', password: '123123123').find_or_create_by(email: 'petia.pato4kin@gmail.com', categgory_id: Categgory.last.id)

Categgory.last(2).each do |k|
  %w[хімія біологія].each{|s| Subject.create_with(categgory_id: k.id).find_or_create_by(name: s)}
end

Subject.last(2).each do |s|
  %w[тема1 тема2].each{|t| Theme.create_with(subject_id: s.id).find_or_create_by(name: t)}
end

Theme.last(2).each do |t|
  %w[тест1 тест2].each{ |tt| TestSetting.create_with(theme_id: t.id).find_or_create_by(name: tt) }
end

TestSetting.last(2).each do |ts|
  Test.create_with(user_id: User.first.id).find_or_create_by(test_setting_id: ts.id)
end

20.times do |n|
  title = "Title#{n+1}"
  text = Faker::Lorem.paragraph(15)
  Tiding.create_with(text: text,
                     main: false).find_or_create_by(title: title)
end

Tiding.create_with(text: Faker::Lorem.paragraph(20), main: true).find_or_create_by(title: 'Main news')

# [:admin, :student, :teacher].each do |role|
#   Role.find_or_create_by(name: role)
# end

# User.create_with(full_name: 'admin admin', password: 'password').find_or_create_by(email: 'admin@gmail.com').add_role(:admin)

# # User.delete_all

# 20.times do |n|
#   name  = "student#{n+1}"
#   email = "student#{n+1}@gmail.com"
#   password  = "password"
#   categgory_id = Categgory.first.id + Faker::Number.between(1, 10)
#   User.create_with(full_name: name,
#                    categgory_id: categgory_id,
#                    password: password,
#                    password_confirmation: password).find_or_create_by(email: email).add_role(:student)
# end


# 20.times do |n|
#   name  = "teacher#{n+1}"
#   email = "teacher#{n+1}@gmail.com"
#   password  = "password"
#   subject_id = Subject.first.id + Faker::Number.between(0, 1)
#   categgory_id = Categgory.first.id + Faker::Number.between(1, 10)
#   User.create_with(full_name: name,
#                    categgory_id: categgory_id,
#                    subject_id: subject_id,
#                    password: password,
#                    password_confirmation: password).find_or_create_by(email: email).add_role(:teacher)
# end


# CateggoriesWithSubject.create!(subject_id: Subject.first.id, categgory_id: Categgory.first.id, user_id: 55)
# CateggoriesWithSubject.create!(subject_id: Subject.last.id, categgory_id: Categgory.first.id, user_id: 55)

User.create_with(full_name: 'admis', password: 'password', avatar: Faker::Avatar.image).find_or_create_by(email: 'ad@gmail.com').add_role(:student)

unless Comment.any?
   10.times do |n|
    name  = Faker::Commerce.department
    text = Faker::Lorem.paragraph(5)
    user_id  = User.last.id
    Comment.create!(name: name,
                    text: text,
                    user_id: user_id)
  end
end
