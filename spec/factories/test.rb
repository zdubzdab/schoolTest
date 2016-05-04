FactoryGirl.define do
  factory :test, class: Test do
    complete_pers     Faker::Number.between(0, 100)
    after(:build) { |test| test.class.skip_callback(:create, :after, :count_test_result) }

    factory :test_with_callback do
      after(:create) { |test| test.send(:count_test_result) }
    end
  end
end
