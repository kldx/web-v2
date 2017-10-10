class AddDeletedAtToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :deleted_at, :datetime
    add_index :articles, :deleted_at
  end
end
