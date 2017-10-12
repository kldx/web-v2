class Api::V1::ArticlesController < Api::V1::BaseController
  def index
    articles = Article.approved
    render jsonapi: articles, each_serializer: Api::V1::ArticleSerializer
  end

  def show
    article = Article.friendly.find params[:id]
    render jsonapi: article, serializer: Api::V1::ArticleSerializer
  end
end
