class User < ApplicationRecord
  has_many :animals
  has_many :bookings
  has_many :bookings_as_owner, through: :animals, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
