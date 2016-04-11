FactoryGirl.define do
  factory :tiding do
    title    Faker::Commerce.department
    text     Faker::Lorem.paragraph
    main     true
  end
end
