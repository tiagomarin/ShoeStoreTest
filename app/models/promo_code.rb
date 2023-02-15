class PromoCode < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :brands

  validates :title, presence: true,
                    length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
  validates :value, presence: true,
                    numericality: { only_float: true }
end
