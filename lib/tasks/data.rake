namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    create_tests
  end
end

def create_tests
  TestSetting.last(12).each do |ts|
    User.last(10).each do |u|
      user_id = u.id
      complete_pers = Faker::Number.between(1, 100)
      Test.create!(user_id: user_id,
                   test_setting_id: ts.id,
                   complete_pers: complete_pers)
    end
  end
end

# bundle exec rake db:populate
# bundle exec rake test:prepare
