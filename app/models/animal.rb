class Animal < ApplicationRecord
  belongs_to :user
  has_many :booking
  validates :category, presence: true
  validates :name, presence: true
  validates :price, presence: true
end
