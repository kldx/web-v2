class PagesController < ApplicationController
  def index
    @articles = Article.approved
  end
end
