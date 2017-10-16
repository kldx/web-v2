class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:new, :create]

  def new
    @order ||= Order.new
    render
  end

  def create
    @order = @item.orders.new order_params
    if @order.save
      redirect_to shop_show_path(@item), notice: 'Order created!'
    else
      render 'new'
    end
  end

  private

    def set_item
      @item = Item.friendly.find params[:item_id]
    end

    def order_params
      params.require(:order).permit(:quantity, :price, :status, :user_id, :item_id)
    end
end
