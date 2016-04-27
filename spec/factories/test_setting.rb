FactoryGirl.define do
  factory :test_setting do
    sequence(:name) { |n| "Name№#{n}" }
    description     Faker::Lorem.paragraph(5)
    max_tried_count Faker::Number.between(2, 5)
    time_to_pass    Faker::Number.between(60, 120)

    factory :test_setting_with_teachers do
      after(:create) { |test_setting| test_setting.users << FactoryGirl.create(:user) }
    end
  end
end
