class Admin::Store::CouponsController < AdminController
  before_action :set_item, only: [:index, :new, :create]
  before_action :set_coupon, only: [:show, :edit, :update]

  def index
    @coupons = @item.coupons
  end

  def new
    @coupon ||= @item.coupons.new
    render
  end

  def create
    @coupon = @item.coupons.new coupon_params
    if @coupon.save
      redirect_to admin_store_item_coupon_path(@coupon, item_id: @coupon.item), notice: 'Item created!'
    else
      render 'new'
    end
  end

  def show() end

  def edit
    if @coupon
      render
    else
      redirect_to admin_store_item_coupons_path(@coupon), notice: 'Coupon not found!'
    end
  end

  def update
    if @coupon.update coupon_params
      redirect_to admin_store_item_coupon_path(@coupon, item_id: @coupon.item), notice: 'Coupon updated!'
    else
      render 'edit'
    end
  end

  private

    def set_item
      @item = Item.friendly.find params[:item_id]
    end

    def set_coupon
      @coupon = Coupon.find params[:id]
    end

    def coupon_params
      params.require(:coupon).permit(:item_id, :description, :code, :valid_from, :valid_until, :redemption_limit, :coupon_redemptions_count, :amount)
    end
end
