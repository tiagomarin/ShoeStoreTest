class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many_attached :images
  belongs_to :brand
  # belongs_to :category
  has_and_belongs_to_many :category

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

  # FILTER_PARAMS = %i[
  #                     clear_filters
  #                     query
  #                     size_filters
  #                     color_filters
  #                     brand_filters
  #                     category_filters
  #                     min_price_filter
  #                     max_price_filter
  #                     remove_size_filter
  #                     remove_color_filter
  #                     remove_brand_filter
  #                     remove_category_filter
  #                     remove_min_price_filter
  #                     remove_max_price_filter
  #                   ].freeze

  # scope :by_name, ->(name) { where('name LIKE ?', "%#{name}%") }
  # scope :by_size, ->(size) { where(size: size.to_f) }
  # scope :by_color, ->(color) { where('color LIKE ?', "%#{color}%") }
  # scope :by_brand, ->(brand) { where('brand_id LIKE ?', "%#{brand}%") }
  # scope :by_gender, ->(gender) { where('gender_id LIKE ?', "%#{gender}%") }
  # scope :by_category, ->(category) { joins(:category).where('category_id LIKE ?', "%#{category}%") }
  # scope :by_brand, ->(brand) { joins(:brand).where('brand_id LIKE ?', "%#{brand}%") }
  # scope :by_min_price, ->(min_price) { where('price >= ?', min_price.to_f) }
  # scope :by_max_price, ->(max_price) { where('price <= ?', max_price.to_f) }
end
