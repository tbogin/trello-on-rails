class User < ActiveRecord::Base
  has_secure_password
  validates :name, :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  has_many :boards
  has_many :lists
  has_many :cards
  has_many :comments
end
