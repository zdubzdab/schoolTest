class Test < ActiveRecord::Base
  belongs_to :test_setting
  belongs_to :user
  has_one :theme, through: :test_setting
  has_many :answers

  accepts_nested_attributes_for :answers

  resourcify#rolify

  after_create :count_test_result

    private
    def count_test_result
      TestResultCalculation::CountResult.new(self).count_and_paste_test_result
    end

end
