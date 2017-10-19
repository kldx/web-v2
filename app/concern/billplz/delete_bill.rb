module Billplz
  class DeleteBill
    def self.retrieve(bill_id)
      HTTParty.delete(Settings.billplz.bills.url+"/#{bill_id}",
      {
        :basic_auth => {
          :username => ENV['BILLPLZ_API_KEY']
        }
      })
    end
  end
end
