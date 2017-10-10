class Admin::ArticlesController < AdminController
  before_action :set_user, only: [:new, :create]
  before_action :find_article, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article ||= Article.new
    render
  end

  def create
    @article = @user.articles.new article_params
    if @article.save
      redirect_to admin_articles_path, notice: 'Article created!'
    else
      render 'new'
    end
  end

  def edit
    if @article
      render
    else
      redirect_to admin_articles_path, notice: 'Article not found!'
    end
  end

  def update
    if @article.update article_params
      redirect_to admin_articles_path, notice: 'Article updated!'
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      respond_to do |format|
        format.js { redirect_to admin_articles_path, notice: "Article has been destroyed" }
      end
    else
      render 'index'
    end
  end

  private


    def set_user
      @user = current_user
    end

    def find_article
      @article = Article.friendly.find params[:id]
      rescue ActiveRecord::RecordNotFound
        redirect_to admin_articles_url, :notice => 'Record not found'
    end

    def article_params
      params.require(:article).permit(:title, :content, :default_picture, :default_picture_cache, :status, :quantity, :featured, :category_id, :user_id)
    end
end
