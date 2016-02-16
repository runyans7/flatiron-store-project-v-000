require 'pry'
class User < ActiveRecord::Base
  has_secure_password
  has_many :carts

  def current_cart=(cart)

  end

  def current_cart
    carts[0]
  end
end
