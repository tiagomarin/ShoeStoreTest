class Collection < ApplicationRecord
  has_one :home_collection
  has_many :products
  has_one_attached :collectionImage

  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
end
