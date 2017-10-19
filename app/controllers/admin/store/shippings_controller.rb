class Admin::Store::ShippingsController < AdminController
  before_action :set_shipping, only: [:edit, :update, :show, :checking, :registering, :delivering]

  def show() end

  def edit() end

  def update
    if @shipping.update shipping_params
      redirect_to admin_store_order_shippings_path, notice: 'Shipping details was successfully updated.'
    else
      render :edit
    end
  end

  def checking
    @shipping.checking
    @shipping.update_attributes(status: :ready_to_ship, prepare_at: nil)
    @shipping.touch :ready_at
  end

  def registering
    @shipping.registering
    @shipping.update_attributes(status: :shipped, ready_at: nil)
    @shipping.touch :shipped_at
  end

  def delivering
    @shipping.delivering
    @shipping.update_attributes(status: :delivered, shipped_at: nil)
    @shipping.touch :delivered_at
  end

  private

    def set_shipping
      @shipping = Shipping.find_by_order_id params[:order_id]
    end

    def shipping_params
      params.require(:shipping).permit(:tracking_number, :note, :shipping_type, :status, :prepare_at, :ready_at, :shipped_at, :delivered_at)
    end
end
