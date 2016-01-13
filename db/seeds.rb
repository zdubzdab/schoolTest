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

%w[хімія біологія].each do |s|
  Subject.find_or_create_by(name: s)
end

%w[Хімія_тема1 Хімія_тема2 Хімія_тема3].each do |x|
  Theme.create_with(subject_id: Subject.first.id).find_or_create_by(name: x)
end
%w[Біологія_тема1 Біологія_тема2 Біологія_тема3].each do |t|
  Theme.create_with(subject_id: Subject.last.id).find_or_create_by(name: t)
end

Theme.last(6).each do |t|
  2.times do |n|
    name = "#{t.name}_тест#{n}"
    description = Faker::Lorem.paragraph(5)
    max_tried_count = Faker::Number.between(2, 5)
    time_to_pass = Faker::Number.between(60, 120)
    categgory_id = Categgory.first.id + Faker::Number.between(1, 10)
    TestSetting.create_with(theme_id: t.id,
                            subject_id: t.subject_id,
                            categgory_id: categgory_id,
                            description: description,
                            max_tried_count: max_tried_count,
                            time_to_pass: time_to_pass).find_or_create_by(name: name)
  end
end

# TestSetting.last(12).each do |ts|
#   5.times do
#     Question.create_with(test_setting_id: ts.id).find_or_create_by(text: Faker::Lorem.sentence)
#   end
# end

# Question.last(60).each do |q|
#   3.times do
#     rigth = [true, false].sample
#     few_answers = [true, false].sample
#     AnswerSetting.create_with(question_id: q.id,
#                               rigth: rigth,
#                               few_answers: few_answers).find_or_create_by(name: Faker::Lorem.sentence)
#   end
# end

TestSetting.last(12).each do |ts|
  Test.create_with(user_id: User.first.id + Faker::Number.between(22, 41)).find_or_create_by(test_setting_id: ts.id)
end

20.times do |n|
  title = "Title#{n+1}"
  text = Faker::Lorem.paragraph(15)
  Tiding.create_with(text: text,
                     main: false).find_or_create_by(title: title)
end

Tiding.create_with(text: Faker::Lorem.paragraph(20), main: true).find_or_create_by(title: 'Main news')

[:admin, :student, :teacher].each do |role|
  Role.find_or_create_by(name: role)
end

User.create_with(full_name: 'admin admin', password: 'password').find_or_create_by(email: 'admin@gmail.com').add_role(:admin)

# User.delete_all

20.times do |n|
  name  = "teacher#{n+1}"
  email = "teacher#{n+1}@gmail.com"
  password  = "password"
  subject_id = Subject.first.id + Faker::Number.between(0, 1)
  avatar = File.open(Rails.root + "app/assets/images/image.jpg")
  User.create_with(full_name: name,
                   subject_id: subject_id,
                   avatar: avatar,
                   password: password,
                   password_confirmation: password).find_or_create_by(email: email).add_role(:teacher)
end

20.times do |n|
  name  = "student#{n+1}"
  email = "student#{n+1}@gmail.com"
  password  = "password"
  categgory_id = Categgory.first.id + Faker::Number.between(1, 10)
  User.create_with(full_name: name,
                   categgory_id: categgory_id,
                   password: password,
                   password_confirmation: password).find_or_create_by(email: email).add_role(:student)
end

# User.last(20).each do |u|
#   Subject.last(2).each do |s|
#     CateggoriesWithSubject.create!(categgory_id: u.categgory_id, subject_id: s.id, user_id: u.id)
#   end
# end

20.times do |n|
  name = "Comment_name#{n+1}"
  text = Faker::Lorem.paragraph(8)
  user_id  = User.first.id + Faker::Number.between(1, 30)
  Comment.create_with(text: text, user_id: user_id).find_or_create_by(name: name)
end

