class Card < ActiveRecord::Base
  validates :title, presence: true, on: :create, on: :update

  belongs_to :board
  has_many :labels
  has_many :comments

end
