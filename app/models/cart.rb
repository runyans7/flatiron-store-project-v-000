require 'pry'
class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def checkout
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end

    self.line_items.map(&:destroy)
  end

  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    total
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)

    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: item_id, quantity: 1)
    end
    line_item
  end

end
