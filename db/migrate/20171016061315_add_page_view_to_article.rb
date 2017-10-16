class AddPageViewToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :page_view, :integer, default: 0, null: false
  end
end
