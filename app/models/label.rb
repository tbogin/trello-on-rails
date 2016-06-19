class Label < ActiveRecord::Base
  validates :color, presence: true

  belongs_to :card
end
