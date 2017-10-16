class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]
  mount_uploader :default_picture, DefaultPictureShopUploader
  is_impressionable

  belongs_to :user

  scope :sort, -> { order('items.created_at DESC') }
  scope :featured, -> { where ('featured = TRUE')}

  before_save :set_in_stock

  validates_presence_of :name, :quantity, :description, :default_price
  validates_numericality_of :quantity

  def should_generate_new_friendly_id?
    name_changed?
  end

  def set_in_stock
    if self.quantity.nil? || self.quantity == 0
      self.in_stock = false
    else
      self.in_stock = true
    end
  end
end
