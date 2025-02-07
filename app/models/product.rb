class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_one_attached :image1
  has_one_attached :iconicImage

  belongs_to :brand
  belongs_to :color
  belongs_to :size
  belongs_to :gender
  belongs_to :collection
  # belongs_to :category
  has_and_belongs_to_many :category

  has_one :iconic
  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user

  validates :name, presence: true,
                   length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 500, too_long: '%<count>s characters is the maximum allowed' }
  validates :size, presence: true
  validates :color, presence: true
  validates :gender, presence: true
  validates :brand, presence: true
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # validates :category_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
