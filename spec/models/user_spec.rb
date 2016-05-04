require 'rails_helper'

describe User do

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  let(:user) { FactoryGirl.create(:user) }

  describe 'validations' do

    it { expect validate_presence_of :full_name }
    it { expect validate_uniqueness_of(:full_name) }
    it { expect(user).to allow_value("Nik").for(:full_name) }
    it { expect(user).to_not allow_value("N").for(:full_name) }

    it { expect validate_presence_of :email }
    it { expect validate_uniqueness_of(:email) }
    it { expect(user).to allow_value("user@gmail.com").for(:email) }
    it { expect(user).to_not allow_value("base@example").for(:email) }
    it { expect(user).to_not allow_value("blah.blash").for(:email) }
  end

  describe "associations" do
    it { expect(user).to have_many(:tests) }
    it { expect(user).to have_many(:test_settings) }
    it { expect(user).to have_many(:answers) }
    it { expect(user).to have_many(:methodical_works) }
    it { expect(user).to have_many(:categgories_with_subjects) }
    it { expect(user).to have_many(:categgories).through(:categgories_with_subjects) }
    it { expect(user).to have_many(:subjects).through(:categgories_with_subjects) }
    it { expect(user).to have_many(:comments).dependent(:destroy) }
    it { expect(user).to have_one(:image).dependent(:destroy) }
    it { expect(user).to accept_nested_attributes_for(:image) }
    it { expect(user).to belong_to(:categgory) }
    it { expect(user).to belong_to(:subject) }
  end

  describe "alias method" do

    it "includes user with role teacher" do
      expect(user.avatar).to eq (user.image)
    end
  end

  describe "scope users" do

    it "includes user with role student" do
      user.add_role(:student)
      expect(User.students).to include(user)
    end

    it "excludes user with role student" do
      expect(User.students).not_to include(user)
    end
  end

  describe "scope teachers" do

    it "includes user with role teacher" do
      user.add_role(:teacher)
      expect(User.teachers).to include(user)
    end

    it "excludes user with role teacher" do
      expect(User.teachers).not_to include(user)
    end
  end

end
