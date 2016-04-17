%w[перший другий третій четвертий п’ятий шостий сьомий восьмий дев’ятий десятий одинадцятий].each do |i|
  Categgory.find_or_create_by(name: i)
end

%w[хімія біологія].each do |s|
  Subject.find_or_create_by(name: s)
end

%w[Хімія_тема1 Хімія_тема2].each do |x|
  Theme.create_with(subject_id: Subject.first.id).find_or_create_by(name: x)
end
%w[Біологія_тема1 Біологія_тема2].each do |t|
  Theme.create_with(subject_id: Subject.last.id).find_or_create_by(name: t)
end

Theme.last(4).each do |t|
  User.first(10).each do |u|
    name = "#{t.name}_тест_вчителя#{u.full_name}"
    description = Faker::Lorem.paragraph(5)
    max_tried_count = Faker::Number.between(2, 5)
    time_to_pass = Faker::Number.between(60, 120)
    categgory_id = Categgory.first.id + Faker::Number.between(1, 10)
    user_id = u.id
    TestSetting.create_with(theme_id: t.id,
                            subject_id: t.subject_id,
                            categgory_id: categgory_id,
                            description: description,
                            max_tried_count: max_tried_count,
                            user_id: user_id,
                            time_to_pass: time_to_pass).find_or_create_by(name: name)
  end
end

Question.delete_all
TestSetting.last(40).each do |ts|
  3.times do
    Question.create_with(test_setting_id: ts.id).find_or_create_by(text: Faker::Lorem.sentence)
  end
end

AnswerSetting.delete_all
Question.last(120).each do |q|
  3.times do
    rigth = [true, false].sample
    few_answers = [true, false].sample
    AnswerSetting.create_with(question_id: q.id,
                              rigth: rigth,
                              few_answers: few_answers).find_or_create_by(name: Faker::Lorem.sentence)
  end
end

Tiding.delete_all
20.times do |n|
  title = Faker::Commerce.department
  text = Faker::Lorem.paragraph(15)
  main = [true, false].sample
  Tiding.create_with(text: text,
                     main: main).find_or_create_by(title: title)
end

[:admin, :student, :teacher].each do |role|
  Role.find_or_create_by(name: role)
end

User.create_with(full_name: 'admin', password: 'password').find_or_create_by(email: 'admin@gmail.com').add_role(:admin)

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

CateggoriesWithSubject.delete_all
User.last(20).each do |u|
  Subject.last(2).each do |s|
    CateggoriesWithSubject.create!(categgory_id: u.categgory_id, subject_id: s.id, user_id: u.id)
  end
end

20.times do |n|
  name = "Comment_name#{n+1}"
  text = Faker::Lorem.paragraph(8)
  user_id  = User.first.id + Faker::Number.between(1, 30)
  Comment.create_with(text: text, user_id: user_id).find_or_create_by(name: name)
end
