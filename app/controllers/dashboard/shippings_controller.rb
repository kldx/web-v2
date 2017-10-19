class Dashboard::ShippingsController < DashboardController
  before_action :set_user, only: [:show]
  before_action :find_order, only: [:show]

  def show
    @shipping = @order.shipping
    if @shipping
      render
    else
      redirect_to dashboard_orders_path, notice: 'Shipping not found!'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def find_order
    @order = @user.orders.find params[:order_id]
    rescue ActiveRecord::RecordNotFound
      redirect_to(dashboard_orders_url, :notice => 'Record not found')
  end
end
