class Test < ActiveRecord::Base
  belongs_to :test_setting
  belongs_to :user
  has_one :theme, through: :test_setting
  has_many :answers

  accepts_nested_attributes_for :answers

  after_create :count_and_paste_result_into_test_table

  # include ZdubzdabHola::CountResult::LocalInstanceMethods
  include MyModule

  resourcify#rolify
end
