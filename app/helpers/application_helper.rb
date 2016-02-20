module ApplicationHelper

  def current_cart
    current_user.carts.first
  end

  def to_dollars(price)
    price.to_f / 100
  end
end
