require 'pry'
class CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])
  end

  def checkout
    @cart = current_user.current_cart
    @cart.checkout
    current_user.carts.clear
    current_user.current_cart = nil

    if @cart.save && current_user.save
      redirect_to cart_path(@cart)
      @cart = nil
      flash[:notice] = "Thank you for your order"
    end
  end

end
