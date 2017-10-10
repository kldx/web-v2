class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title
      t.text :content
      t.string :default_picture
      t.integer :status, default: 0
      t.boolean :featured, default: false
      t.string :slug

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
