class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :line_item, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
