class OrdersController < ApplicationController
def show
  @order = current_user.orders.where(state: 'paid').find(params[:id])
end
def create
  flat = Flat.find(params[:flat_id])
  order  = Order.create!(flat_id: flat.id, amount: flat.price, state: 'pending', user: current_user)
  redirect_to new_order_payment_path(order)
end
end
