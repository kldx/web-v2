class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :activities, :deleted_at
  end
end
