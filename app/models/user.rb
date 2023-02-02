class User < ApplicationRecord
  has_many :order, dependent: :destroy
end
