# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# natalia.turok1105@gmail.com

teacher = User.create_with(admin: true, full_name: 'Адмін Адмін', password: '123123123').find_or_create_by(email: 'admin.admin@gmail.com')

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
  Test.create_with(user_id: @petia_user.id).find_or_create_by(test_setting_id: ts.id)
end

Tiding.delete_all
5.times do |n|
  title  = Faker::Commerce.department
  text = Faker::Lorem.paragraph
  main  = false
  ava = Faker::Avatar.image("my-own-slug")
  Tiding.create!(title: title,
               text: text,
               main: main)
end

Tiding.create_with(text: Faker::Lorem.paragraph(15), main: true).find_or_create_by(title: 'Main news')
