FactoryGirl.define do
  factory :answer_setting do
    few_answers   [true, false].sample
    sequence(:name) { |n| "Name№#{n}" }
  end
end
