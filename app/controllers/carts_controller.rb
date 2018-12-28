class CartsController < ApplicationController
  # before_action :require_login, except: [:index, :show]

  def index
    carts = Cart.all
    render json: {carts: carts}
  end

  def show
    cart = Cart.find(params[:id])
    render json: {cart: cart}
  end

  def update
    # byebug
    cart = Cart.find(params[:id])
    cart.update(ordered: cart_params[:ordered])
    render json: {message: "updated", cart: cart}
  end

  def create
    # byebug
    cart = Cart.create(cart_params)
    if cart.valid?
      render json: { message: 'ok', cart: cart}
    else
      render json: {message: "error: could not add to cart", cart: cart}
    end
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy

    render json: {message: "cart has been destroyed"}


  end

  private

  def cart_params
    # params[:total_price] = params[:quantity] * params[:total_price]
    params.require(:cart).permit(:name, :quantity, :total_price, :ordered, :user_id, :product_id)

  end
end
