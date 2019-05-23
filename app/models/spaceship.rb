class Spaceship < ApplicationRecord
  has_many :rentals
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :price, presence: true
end
