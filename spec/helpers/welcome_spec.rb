require 'rails_helper'

describe WelcomeHelper do
  include WelcomeHelper

  describe "count_images_number method" do
    it "create array" do
      expect(count_images_number(0)).to eq ([])
      expect(count_images_number(1)).to eq ([0])
      expect(count_images_number(3)).to eq ([0, 0, 0])
      expect(count_images_number(5)).to eq ([0, 0, 0, 0, 0])
    end
  end

  describe "check_if_number_of_imag_more_than_one method" do
    it "1 result should be true" do
      expect(check_if_number_of_imag_more_than_one(0)).to eq (false)
    end

    it "2 result should be true" do
      expect(check_if_number_of_imag_more_than_one(1)).to eq (false)
    end

    it "3 result should be false" do
      expect(check_if_number_of_imag_more_than_one(2)).to eq (true)
    end

    it "4 result should be false" do
      expect(check_if_number_of_imag_more_than_one(100)).to eq (true)
    end
  end

end
