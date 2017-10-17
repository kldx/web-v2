class Dashboard::InvoicesController < DashboardController
  before_action :set_user, only: [:show]
  before_action :find_order, only: [:show]

  def show
    respond_to do |format|
      if @order.invoice
        format.pdf do
          pdf = InvoicePdf.new(@order, @order.invoice, view_context)
          send_data pdf.render, filename: "Invoice ID: ##{@order.invoice.invoice_id} - Payment for #{@order.item.name}",
          type: "application/pdf",
          disposition: "inline"
        end
      else
        redirect_to dashboard_orders_path, notice: 'Invoice not found!'
      end
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
