class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tests
  has_many :answers
  belongs_to :klass

  validates_presence_of :full_name
  validates_presence_of :klass_id, unless: :i_am_not_teacher

  def i_am_not_teacher
    self.admin
  end
end
