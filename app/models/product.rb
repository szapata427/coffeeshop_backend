class Product < ApplicationRecord
  # belongs_to :seller
  # has_many :carts
  # has_many :customers, through :carts
  has_many :sellers, class_name: "Seller"
  has_many :customers, class_name: "Customer"
end
