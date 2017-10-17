class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :order, foreign_key: true
      t.string :invoice_id
      t.string :state
      t.boolean :paid
      t.datetime :payment_at

      t.timestamps
    end
    add_index :invoices, :invoice_id, unique: true
  end
end
