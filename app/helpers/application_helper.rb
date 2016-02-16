module ApplicationHelper
  def current_cart
    current_user.carts[0]
  end
end
