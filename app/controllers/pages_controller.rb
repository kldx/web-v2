class PagesController < ApplicationController
  before_action :list_activity, only: [:index, :show, :category]

  def index
    @articles = Article.approved.page params[:page]
    @banners = Banner.where sort: 0..2
  end

  def show
    @article = Article.approved.friendly.find params[:id]
    @impressionist = impressionist(@article)
    rescue ActiveRecord::RecordNotFound
      redirect_to(root_url, :notice => 'Record not found')
  end

  def category
    @category = Category.find_by_slug params[:sort]
    @articles = Article.by_category(@category.id).approved.page(params[:page])
  end

  def activities
    @activities_this_month = Activity.this_month
    @activities_next_month = Activity.next_month
  end

  def crew() end

  def about() end

  def shop
    @items = Item.sort
  end

  def shop_show
    @random_items = Item.order("RANDOM()").limit(2)
    @item = Item.friendly.find params[:id]
    @impressionist = impressionist(@item)
    rescue ActiveRecord::RecordNotFound
      redirect_to(root_url, :notice => 'Record not found')
  end

  private

    def list_activity
      @activities_this_month = Activity.this_month.limit(3)
    end
end
