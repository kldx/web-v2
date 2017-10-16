class AddPageViewToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :page_view, :integer, default: 0, null: false
  end
end
