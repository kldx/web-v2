class Banner < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  mount_uploader :default_picture, DefaultPictureUploader
  # process_in_background :default_picture
  include RailsSortable::Model
  set_sortable :sort

  belongs_to :user

  enum status: [:pending, :approved, :rejected]

  scope :pending, -> { where ('status = 0')}
  scope :approved, -> { where ('status = 1')}
  scope :rejected, -> { where ('status = 2')}

  def should_generate_new_friendly_id?
    saved_change_to_title?
  end
end
