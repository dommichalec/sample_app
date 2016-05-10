class User < ActiveRecord::Base
  # callbacks
  before_save { self.email = email.downcase }

  # validations
  validates :first_name, presence: true, length: { in: 1..50 }
  validates :last_name, presence: true, length: { in: 1..50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { in: 5..75 }, email: { strict_mode: true }
  validates :password, presence: true, length: { in: 6..50 }

  has_secure_password
end
