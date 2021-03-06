class Banner < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  mount_uploader :default_picture, DefaultPictureUploader
  # process_in_background :default_picture
  include RailsSortable::Model
  set_sortable :sort

  validates_presence_of :title, :default_picture

  belongs_to :user

  enum status: [:pending, :approved, :rejected]

  scope :pending, -> { where ('status = 0')}
  scope :approved, -> { where ('status = 1')}
  scope :rejected, -> { where ('status = 2')}

  def should_generate_new_friendly_id?
    will_save_change_to_title?
  end
end
