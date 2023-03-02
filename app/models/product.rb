class Product < ApplicationRecord
  paginates_per 10
  has_many :order_items, dependent: :destroy
  has_many_attached :images
  belongs_to :brand
  # belongs_to :category
  has_and_belongs_to_many :category

  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user

  validates :name, presence: true,
                   length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 200, too_long: '%<count>s characters is the maximum allowed' }
  validates :size, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :color, presence: true
  validates :gender, presence: true
  validates :brand_id, presence: true
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  # validates :category_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
