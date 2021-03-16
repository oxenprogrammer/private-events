class User < ApplicationRecord
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, length: { minimum: 6, maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 6 }, presence: true
end
