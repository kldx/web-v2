class CreateShippings < ActiveRecord::Migration[5.1]
  def change
    create_table :shippings do |t|
      t.references :order, foreign_key: true
      t.integer :status, default: 0
      t.integer :type
      t.string :tracking_number
      t.text :note
      t.datetime :prepare_at
      t.datetime :ready_at
      t.datetime :shipped_at
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
