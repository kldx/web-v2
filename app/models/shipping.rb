class Shipping < ApplicationRecord
  include AASM
  enum status: [:preparation, :ready_to_ship, :shipped, :delivered]
  enum shipping_type: [:pos_laju, :skynet, :gdex, :dhl, :fedex, :taqbin, :ninja_van, :nationwide_express, :ups]

  belongs_to :order

  after_create :set_prepare_at

  aasm do
    state :preparation, :initial => true
    state :ready_to_ship, :shipped, :delivered

    event :checking do
      transitions :from => :preparation, :to => :ready_to_ship
    end

    event :registering do
      transitions :from => :ready_to_ship, :to => :shipped
    end

    event :delivering do
      transitions :from => :shipped, :to => :delivered
    end
  end

  def set_prepare_at
    self.touch :prepare_at
  end

  def set_shipping_type
    if self.shipping_type.nil?
      "<small><i>Will update soon once your item move to Ship status</i></small>".html_safe
    else
      self.shipping_type.titleize.split(/ |\_|\-/).map(&:capitalize).join(" ")
    end
  end

  def set_tracking_number
    if self.tracking_number.nil?
      "<small><i>Will update soon once your item move to Ship status</i></small>".html_safe
    else
      self.tracking_number
    end
  end

  def set_note
    if self.note.nil?
      "N/A"
    else
      self.note
    end
  end
end
