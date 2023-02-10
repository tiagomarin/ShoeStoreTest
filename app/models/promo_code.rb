class PromoCode < ApplicationRecord
  validates :title, presence: true,
                    length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
  validates :value, presence: true,
                    numericality: { only_float: true }
end
