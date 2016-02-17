require 'pry'
class StoreController < ApplicationController
  def index
    @items = Item.available_items
    @categories = Category.order(:title)
  end
end
