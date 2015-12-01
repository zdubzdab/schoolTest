class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :ensure_authentication_token
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tests
  has_many :answers
  # TODO: rename foreign_key
  belongs_to :categgory, foreign_key: 'klass_id'
  belongs_to :subject
  has_many :categgories_with_subjects

  mount_uploader :avatar, AvatarUploader

  validates :full_name, presence: true,
                    length: { minimum: 2 },
                    uniqueness: true
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                    message: :bad_email_format } ,
                    uniqueness: true

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

  class Entity < Grape::Entity
    expose :id
    expose :full_name
    expose :email
    expose :categgory, using: Categgory::Entity
    expose :admin
    expose :categgories_with_subjects, using: CateggoriesWithSubject::Entity
  end

end
