class Dashboard::OrdersController < DashboardController
  before_action :set_user, only: [:index, :review]

  def index
    @orders = @user.orders
  end

  def review
    @order = @user.orders.find params[:id]
  end

  private

    def set_user
      @user = current_user
    end
end
