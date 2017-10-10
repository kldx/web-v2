class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  default_scope -> { order('categories.name DESC') }

  def should_generate_new_friendly_id?
    name_changed?
  end
end
