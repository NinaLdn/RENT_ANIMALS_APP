class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal, dependent: :destroy
  has_many :reviews
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :total_price, presence: true
end
