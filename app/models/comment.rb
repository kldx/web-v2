class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  default_scope -> { order('comments.created_at ASC') }

  validates_presence_of :body
end
