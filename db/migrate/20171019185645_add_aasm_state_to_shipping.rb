class AddAasmStateToShipping < ActiveRecord::Migration[5.1]
  def change
    add_column :shippings, :aasm_state, :string
  end
end
