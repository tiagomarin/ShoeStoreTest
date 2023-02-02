class User < ApplicationRecord
  has_many :order, dependent: :destroy

  validates :name, presence: true, uniqueness: true,
  length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }
end
