class CreateBanners < ActiveRecord::Migration[5.1]
  def change
    create_table :banners do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :default_picture
      t.integer :status, default: 0
      t.integer :sort
      t.string :slug

      t.timestamps
    end
    add_index :banners, :slug, unique: true
  end
end
