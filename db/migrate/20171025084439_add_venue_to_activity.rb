class AddVenueToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :venue, :string
  end
end
