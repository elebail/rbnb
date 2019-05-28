class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship

  validates :rating, presence: true
end
