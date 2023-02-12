class Brand < ApplicationRecord
  has_many :products
  has_and_belongs_to_many :promo_codes

  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
end
