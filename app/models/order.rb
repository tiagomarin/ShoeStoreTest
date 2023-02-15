class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_and_belongs_to_many :promo_codes, dependent: :destroy

  validates :status, presence: true
end
