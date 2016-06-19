class Card < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :list
  belongs_to :user
  has_many :labels
  has_many :comments
end
