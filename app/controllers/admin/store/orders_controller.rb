class Admin::Store::OrdersController < AdminController
  def index
    @orders = Order.sort
  end

  def review
    @order = Order.find params[:id]
  end

  def show
    #code
  end
end
