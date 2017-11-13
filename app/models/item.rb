class Item < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]
  mount_uploader :default_picture, DefaultPictureShopUploader
  is_impressionable :counter_cache => true, :column_name => :page_view, :unique => true

  validates_presence_of :name, :description, :default_picture

  belongs_to :user
  has_many :orders

  scope :sort, -> { order('items.created_at DESC') }
  scope :featured, -> { where ('featured = TRUE')}

  before_save :set_in_stock
  after_create :create_collection

  validates_presence_of :name, :quantity, :description, :default_price
  validates_numericality_of :quantity

  def should_generate_new_friendly_id?
    will_save_change_to_name?
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
    sale.price.nil? ? default_price : sale_price
  end

  private

    def create_collection
      response = Billplz::PostCollection.send(self.name)
      self.update_attribute(:collection_id, response["id"])
    end

end
