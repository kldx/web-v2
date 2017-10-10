class Banner < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  mount_uploader :default_picture, DefaultPictureUploader

  belongs_to :user

  enum status: [:pending, :approved, :rejected]

  scope :pending, -> { where ('status = 0')}
  scope :approved, -> { where ('status = 1')}
  scope :rejected, -> { where ('status = 2')}

  def should_generate_new_friendly_id?
    title_changed?
  end
end
