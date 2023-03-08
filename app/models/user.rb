class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #   has_many :order, dependent: :destroy
  paginates_per 10
  has_many :orders, dependent: :destroy
  has_one_attached :avatar

  has_many :favorites
  has_many :favorite_products, through: :favorites, source: :product

  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
end
