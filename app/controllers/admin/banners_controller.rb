class Admin::BannersController < AdminController
  before_action :set_user, only: [:new, :create]
  before_action :find_banner, only: [:show, :edit, :update]

  def index
    @banners = Banner.order(:sort).all

  end

  def new
    @banner ||= Banner.new
    render
  end

  def create
    @banner = @user.banners.new banner_params
    if @banner.save
      redirect_to admin_banners_path, notice: 'Banner created!'
    else
      render 'new'
    end
  end

  def show
    if @banner
      render
    else
      redirect_to admin_banners_path, notice: 'Banner not found!'
    end
  end

  def edit
    if @banner
      render
    else
      redirect_to admin_banners_path, notice: 'Banner not found!'
    end
  end

  def update
    if @banner.update banner_params
      redirect_to admin_banners_path, notice: 'Banner updated!'
    else
      render 'edit'
    end
  end

  private


    def set_user
      @user = current_user
    end

    def find_banner
      @banner = Banner.friendly.find params[:id]
      rescue ActiveRecord::RecordNotFound
        redirect_to admin_banners_url, :notice => 'Record not found'
    end

    def banner_params
      params.require(:banner).permit(:title, :default_picture, :default_picture_cache, :user_id, :sort)
    end
end
