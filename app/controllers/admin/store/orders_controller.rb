class Admin::Store::OrdersController < AdminController
  def index
    @orders = Order.all
  end
end
