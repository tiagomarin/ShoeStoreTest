class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy

  validates :name, presence: true, uniqueness: true,
  length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
  validates :price, presence: true,
  numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 200, too_long: '%<count>s characters is the maximum allowed' }
  validates :size, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :color, presence: true
  validates :gender , presence: true
  validates :brand , presence: true
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :category , presence: true
end
