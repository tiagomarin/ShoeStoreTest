class Size < ApplicationRecord
  has_many :products

  validates :number, presence: true, uniqueness: true, numericality: { greater_than_or_equal_to: 0 }
end
