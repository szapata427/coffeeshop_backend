class ProductsController < ApplicationController

  def index
    # byebug
    product = Product.all
    render json: product
  end

  def create
    # byebug
    product = Product.create(product_params)
    render json: {name: product.name, title: product.title, price: product.price, description: product.description, quantity: product.quantity, sku: product.sku, cost: product.cost, image: product.image, seller_id: product.seller_id}

  end

  private

  def product_params
    params.require(:product).permit(:name, :title, :description, :price, :quantity, :sku, :cost, :image, :weight, :seller_id)

  end
end