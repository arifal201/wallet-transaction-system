class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :password_digest, presence: true

  has_secure_password

  before_save :save_token

  private
  def save_token
    self.token = 'rahasia'
  end
end
