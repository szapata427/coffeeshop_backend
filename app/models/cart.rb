class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true
  validates :quantity, presence: true
end
