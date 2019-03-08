class AddFlatToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :flat, foreign_key: true
  end
end
