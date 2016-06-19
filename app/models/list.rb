class List < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user
  belongs_to :board
  has_many :cards
end
