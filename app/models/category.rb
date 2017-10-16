class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]
  acts_as_paranoid

  has_many :articles

  default_scope -> { order('categories.name DESC') }

  def should_generate_new_friendly_id?
    saved_change_to_name?
  end
end
