class User
  require 'bcrypt'
  include Mongoid::Document
  include ActiveModel::SecurePassword

  before_save { self.email = email.downcase }
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  has_many :leagues

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password


  def password
    @password
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    if BCrypt::Password.new(self.password_digest) == test_password
      self
    else
      false
    end
  end

end
