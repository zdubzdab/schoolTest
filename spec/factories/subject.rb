FactoryGirl.define do
  factory :subject do
    sequence(:name) { |n| "Name№#{n}" }
  end

end
