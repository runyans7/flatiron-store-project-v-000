class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_cart, only: [:create]

  def create
    item = Item.find(params[:item_id])

    @line_item = current_user.current_cart.add_item(item.id)

    if @line_item.save
      redirect_to cart_path(current_user.current_cart)
      flash[:notice] = 'Item added to cart!'
    else
      redirect_to store_path
    end
  end
end
