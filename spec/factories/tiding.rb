FactoryGirl.define do
  factory :tiding do
    sequence(:title) { |n| "Title№#{n}" }
    text     Faker::Lorem.paragraph
    main     true
  end
end
