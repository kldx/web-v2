class Dashboard::OrdersController < DashboardController
  before_action :set_user, only: [:index, :review, :callback, :webhook]

  def index
    @orders = @user.orders
  end

  def review
    @order = @user.orders.find params[:id]
  end

  def callback
    @order = @user.orders.find params[:id]
  end

  def webhook
    @order = @user.orders.find params[:id]
    @response = Billplz::GetBill.retrieve(@order.bill_id)
    @invoice = Invoice.find_by_order_id @order
    @order.invoice = @invoice
    if @invoice.save
      @invoice.update_attributes(
                                payment_at: @response["paid_at"],
                                state: @response["state"],
                                paid: @response["paid"])
      if @invoice.state == 'paid'
        @invoice.order.update_attribute(:status, 1)
      end
      redirect_to review_dashboard_order_path(@order)
    else
      render 'index'
    end
  end

  private

    def set_user
      @user = current_user
    end
end
