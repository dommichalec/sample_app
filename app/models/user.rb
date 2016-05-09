class User < ActiveRecord::Base

  validates :first_name, presence: true, length: { in: 1..50 }
  validates :last_name, presence: true, length: { in: 1..50 }
  validates :email, presence: true, length: { in: 5..75 }, email: { strict_mode: true }
end
