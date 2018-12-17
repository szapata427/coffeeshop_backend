class ProductsController < ApplicationController

  def index
    # byebug
    product = Product.all
    render json: product
  end

  def create
    # byebug
    product = Product.create(product_params)
    render json: {name: product.name, title: product.title, price: product.price}

  end

  private

  def product_params
    params.require(:product).permit(:name, :title, :descripton, :price, :quantity, :sku, :cost, :weight, :seller_id)

  end
end
