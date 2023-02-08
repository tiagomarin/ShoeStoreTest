class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #   has_many :order, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
end