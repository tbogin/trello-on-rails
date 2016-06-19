class Card < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user
  belongs_to :list
  has_many :labels
  has_many :comments
end
