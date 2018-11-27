class Animal < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :category, presence: true
  validates :name, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
end
