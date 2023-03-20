class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :code_discount, numericality: { greater_than_or_equal_to: 0 }
end
