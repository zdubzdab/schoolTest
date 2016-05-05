FactoryGirl.define do
  factory :categgory do
    sequence(:name) { |n| "class#{n}" }
  end
end
