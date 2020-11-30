class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 50 }

  has_secure_password
  validates :password, presence: true, allow_nil: false, length: { minimum: 6 }

  def User.digest(string)
    BCrypt::Password.create(string)
  end
end