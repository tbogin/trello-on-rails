class User < ActiveRecord::Base
  has_secure_password
  validates :name, :username, :email, :password, presence: true, on: :create
  validates :username, :email, uniqueness: true, on: :create, on: :update

  has_many :boards
  has_many :comments
end
