FactoryGirl.define do
  factory :theme do
    sequence(:name) { |n| "Name№#{n}" }
  end

end
