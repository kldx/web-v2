class AddColumnToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :default_picture, :string
    add_column :activities, :organizer, :string
  end
end
