class AddCollectionIdToItem < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :collection_id, :string
    add_index :items, :collection_id, unique: true
  end
end
