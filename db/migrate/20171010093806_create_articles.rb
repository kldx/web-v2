class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title
      t.text :content
      t.string :default_picture
      t.integer :status
      t.boolean :featured

      t.timestamps
    end
  end
end
