class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :ensure_authentication_token
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ADMIN_STUDENTS_INDEX_PAGES = 20
  ADMIN_USERS_INDEX_PAGES = 5
  USERS_INDEX_PAGES = 5

  has_many :tests
  has_many :answers
  belongs_to :categgory
  belongs_to :subject
  has_many :categgories_with_subjects
  has_many :categgories, through: :categgories_with_subjects
  has_many :subjects, through: :categgories_with_subjects
  has_many :comments

  mount_uploader :avatar, AvatarUploader

  validates :full_name, presence: true,
                    length: { minimum: 2 },
                    uniqueness: true
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                    message: :bad_email_format } ,
                    uniqueness: true

  scope :students, -> { with_role(:student) }
  scope :teachers, -> { with_role(:teacher) }

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private
    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
