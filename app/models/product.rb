class Product < ApplicationRecord
  belongs_to :seller
  has_many :carts
  has_many :customers, through :carts
end
