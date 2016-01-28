namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    create_tests
  end
end

def create_tests
  TestSetting.last(12).each do |ts|
    User.last(10).each do |u|
      user_id = u.id
      complete_pers = Faker::Number.between(1, 100)
      Test.create!(user_id: user_id,
                   test_setting_id: ts.id,
                   complete_pers: complete_pers)
    end
  end
end

# bundle exec rake db:populate
# bundle exec rake test:prepare


# def make_users
#   admin = User.create!(name:     "Example User",
#                        email:    "example@railstutorial.org",
#                        password: "foobar",
#                        password_confirmation: "foobar",
#                        admin: true)
#   99.times do |n|
#     name  = Faker::Name.name
#     email = "example-#{n+1}@railstutorial.org"
#     password  = "password"
#     User.create!(name:     name,
#                  email:    email,
#                  password: password,
#                  password_confirmation: password)
#   end
# end

# def make_microposts
#   users = User.all(limit: 6)
#   50.times do
#     content = Faker::Lorem.sentence(5)
#     users.each { |user| user.microposts.create!(content: content) }
#   end
# end

# def make_relationships
#   users = User.all
#   user  = users.first
#   followed_users = users[2..50]
#   followers      = users[3..40]
#   followed_users.each { |followed| user.follow!(followed) }
#   followers.each      { |follower| follower.follow!(user) }
# end
