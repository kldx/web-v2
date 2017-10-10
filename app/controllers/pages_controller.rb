class PagesController < ApplicationController
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
end
