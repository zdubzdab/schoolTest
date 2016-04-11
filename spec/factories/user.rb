FactoryGirl.define do
  factory :admin, class: User do
    full_name             "admin"
    email                 "admin@gmail.com"
    password              "password"
    password_confirmation "password"
  end

  factory :user do
    full_name             "user"
    email                 "user@gmail.com"
    password              "password"
    password_confirmation "password"
  end
end
