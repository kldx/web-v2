class Admin::Store::ItemsController < AdminController
  before_action :set_user, only: [:new, :create]
  before_action :find_item, only: [:edit, :update, :destroy]

  def index
    @items = Item.sort
  end

  def new
    @item ||= Item.new
    render
  end

  def create
    @item = @user.items.new item_params
    if @item.save
      redirect_to admin_store_items_path, notice: 'Item created!'
    else
      render 'new'
    end
  end

  def edit
    if @item
      render
    else
      redirect_to admin_store_items_path, notice: 'Item not found!'
    end
  end

  def update
    if @item.update item_params
      redirect_to admin_store_items_path, notice: 'Item updated!'
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to admin_store_items_path, notice: 'Item has been destroyed!'
    else
      render 'index'
    end
  end

  private


    def set_user
      @user = current_user
    end

    def find_item
      @item = Item.friendly.find params[:id]
      rescue ActiveRecord::RecordNotFound
        redirect_to admin_store_items_url, :notice => 'Record not found'
    end

    def item_params
      params.require(:item).permit(:name, :description, :default_picture, :default_picture_cache, :quantity, :in_stock, :default_price, :sale_price, :featured)
    end
end
