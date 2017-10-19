Config.load_and_set_settings("#{Rails.root.join("config", "settings.yml").to_s}", "#{Rails.root.join("config", "settings.local.yml").to_s}", "#{Rails.root.join("config", "settings", "#{Rails.env}.yml").to_s}")

namespace :delete_bill do
  desc 'Delete Order Bill and Invoice'
  task each_order: :environment do
    @order = Order.where(due_date_at: Date.today)
    @order.each do |o|
      Billplz::DeleteBill.retrieve(o.invoice.order.bill_id)
      q = o.invoice.order.quantity + o.invoice.order.item.quantity
      o.invoice.order.item.update_attribute(:quantity, q)

      o.invoice.destroy
      o.invoice.order.destroy
    end
  end
end
