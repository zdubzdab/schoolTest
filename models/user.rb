require 'securerandom'

class User < ActiveRecord::Base
  include BCrypt

  has_many :tests
  has_many :answers
  belongs_to :klass

  validates_presence_of :first_name, :last_name
  validates_presence_of :klass_id, unless: :i_am_not_teacher

  def password=(value)
    write_attribute(:password, BCrypt::Password.create(value))
  end

  def authenticate(attempted_password)
    if self.password == attempted_password
      true
    else
      false
    end
  end

  def i_am_not_teacher
    self.admin
  end

  def generate_auth_token
    self.auth_token = SecureRandom.hex
  end
end
