class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]
  mount_uploader :default_picture, DefaultPictureShopUploader
  is_impressionable

  belongs_to :user
  has_many :orders

  scope :sort, -> { order('items.created_at DESC') }
  scope :featured, -> { where ('featured = TRUE')}

  before_save :set_in_stock
  after_create :create_collection

  validates_presence_of :name, :quantity, :description, :default_price
  validates_numericality_of :quantity

  def should_generate_new_friendly_id?
    saved_change_to_name?
  end

  def set_in_stock
    if self.quantity.nil? || self.quantity == 0
      self.in_stock = false
    else
      self.in_stock = true
    end
  end

  def no_stock
    self.in_stock == false
  end

  def exact_price
    if sale_price.nil?
      default_price
    else
      sale_price
    end
  end

  private

    def create_collection
      response = Billplz::PostCollection.send(self.name)
      self.update_attribute(:collection_id, response["id"])
    end

end
