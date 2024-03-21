class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spaces, dependent: :destroy
  has_many :space_ratings
  has_many :booking_dates, through: :bookings
  has_many :bookings
end
