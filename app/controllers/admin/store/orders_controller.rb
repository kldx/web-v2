class Admin::Store::OrdersController < AdminController
  def index
    @orders = Order.all
  end

  def review
    @order = Order.find params[:id]
  end
end
