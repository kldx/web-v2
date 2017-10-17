class Dashboard::OrdersController < DashboardController
  before_action :set_user, only: [:index]

  def index
    @orders = @user.orders
  end

  private

    def set_user
      @user = current_user
    end
end
