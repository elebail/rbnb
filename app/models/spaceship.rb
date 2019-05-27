class Spaceship < ApplicationRecord
  has_many :rentals
  belongs_to :user
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :price, presence: true

  def self.search(search)
    if search
      spaceship = Spaceship.find_by(name: search)
      if spaceship
        self.where(id: spaceship)
      else
        Spaceship.all
      end
    else
      Spaceship.all
    end
  end
end
