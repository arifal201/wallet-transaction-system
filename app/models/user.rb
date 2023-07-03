class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :password_digest, presence: true

  has_one :wallet
  has_many :transactions

  has_secure_password

  before_save :save_token
  after_create :create_wallet

  def selected_row
    {
      username: self.username,
      email: self.email
    }
  end

  private

  def save_token
    self.token = 'rahasia'
  end

  def create_wallet
    Wallet.create(user: self, balance: 0.0)
  end
end
