FactoryGirl.define do
  factory :question do
    sequence(:text) { |n| "Text№#{n}" }
  end
end
