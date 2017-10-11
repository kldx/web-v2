class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  mount_uploader :default_picture, DefaultPictureUploader
  process_in_background :default_picture
  acts_as_paranoid

  belongs_to :user
  belongs_to :category

  enum status: [:pending, :approved, :rejected]

  default_scope -> { order('articles.created_at DESC') }
  scope :by_category, -> (category_id) { where(category_id: category_id) }
  scope :pending, -> { where ('status = 0')}
  scope :approved, -> { where ('status = 1')}
  scope :rejected, -> { where ('status = 2')}
  scope :featured, -> { where ('featured = TRUE')}

  self.per_page = 5

  def should_generate_new_friendly_id?
    title_changed?
  end
end
