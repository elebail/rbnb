class Spaceship < ApplicationRecord
  include PgSearch
  has_many :rentals
  has_many :reviews
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :price, presence: true

  pg_search_scope :search,
    against: [:name, :description, :price, :max_capacity],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
