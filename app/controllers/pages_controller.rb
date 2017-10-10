class PagesController < ApplicationController
  before_action :list_activity, only: [:index, :category]
  def index
    @articles = Article.approved
    @banners = Banner.where sort: 0..2
  end

  def show
    @article = Article.approved.friendly.find params[:id]
    rescue ActiveRecord::RecordNotFound
      redirect_to(root_url, :notice => 'Record not found')
  end

  def category
    @category = Category.find_by_slug params[:sort]
    @articles = Article.by_category(@category.id).approved
  end

  def activities
    @activities_this_month = Activity.this_month
    @activities_next_month = Activity.next_month
  end

  def crew
    #code
  end

  private

    def list_activity
      @activities_this_month = Activity.this_month.limit(3)
    end
end
