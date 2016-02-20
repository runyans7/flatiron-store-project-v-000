require 'pry'
class StoreController < ApplicationController
  def index
    @items = Item.available_items
    @categories = Category.order(:title)
    @cart = current_user.current_cart if current_user
  end
end
