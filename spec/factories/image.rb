FactoryGirl.define do
  factory :image do

    after :create do |image|
      image.update_column(:photo, '/app/assets/images/image.jpg')
    end

  end
end
