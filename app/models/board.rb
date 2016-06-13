class Board < ActiveRecord::Base
  validates :name, presence: true, on: :create, on: :update

  belongs_to :user
  has_many :cards
end
