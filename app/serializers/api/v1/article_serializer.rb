class Api::V1::ArticleSerializer < ActiveModel::Serializer
  attributes :user, :category
  attributes(*(Article.attribute_names - ["user_id", "category_id"]).map(&:to_sym))
end
