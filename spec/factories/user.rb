FactoryGirl.define do
  factory :user do
    sequence(:full_name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password              "password"
    password_confirmation "password"

    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end

    factory :teacher, class: User do
      after(:create) {|user| user.add_role(:teacher)}
    end

    factory :student, class: User do
      after(:create) {|user| user.add_role(:student)}

      factory :student_with_subjects do
        after(:create) { |student| student.subjects << FactoryGirl.create(:subject) }
      end
    end
  end
end
