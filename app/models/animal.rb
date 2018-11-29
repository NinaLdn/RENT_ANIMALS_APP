class Animal < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :category, presence: true
  validates :name, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_category_description_and_name,
    against: [ :category, :description, :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
