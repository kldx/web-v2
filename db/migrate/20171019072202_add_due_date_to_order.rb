class AddDueDateToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :due_date_at, :datetime
  end
end
