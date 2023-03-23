class Category < ApplicationRecord
  has_and_belongs_to_many :products
  has_and_belongs_to_many :promo_codes, dependent: :destroy
  has_one :home_category
  has_one_attached :categoryImage

  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
end
