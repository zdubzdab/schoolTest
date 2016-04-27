FactoryGirl.define do
  factory :test do
    complete_pers     Faker::Number.between(0, 100)
    after(:build) { |test| test.class.skip_callback(:create, :after, :count_test_result) }

    factory :test_with_run_count_test_result do
      after(:create) { |test| test.send(:count_test_result) }
    end
  end
end


