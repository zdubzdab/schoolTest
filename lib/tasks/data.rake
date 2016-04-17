namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    create_tests
    create_test_setting_for_check_test_passing_procedure
  end
end

def create_tests
  TestSetting.last(40).each do |ts|
    User.last(5).each do |u|
      user_id = u.id
      complete_pers = Faker::Number.between(1, 100)
      Test.create!(user_id: user_id,
                   test_setting_id: ts.id,
                   complete_pers: complete_pers)
    end
  end
end

def create_test_setting_for_check_test_passing_procedure
  TestSetting.create!(theme_id: Theme.last.id,
                      subject_id: Subject.last.id,
                      categgory_id: Categgory.last.id,
                      description: Faker::Lorem.paragraph(5),
                      max_tried_count: 9,
                      user_id: User.first.id,
                      time_to_pass: 100,
                      name: "Провірочний тест")

  3.times do
    Question.create_with(test_setting_id: TestSetting.last.id).find_or_create_by(text: Faker::Lorem.sentence)
  end

  3.times do
    Question.last(3).each do |q|
      rigth = [true, false].sample
      AnswerSetting.create!(question_id: q.id,
                            rigth: rigth,
                            name: rigth,
                            few_answers: false)
    end
  end
end

# bundle exec rake db:populate
# bundle exec rake test:prepare
