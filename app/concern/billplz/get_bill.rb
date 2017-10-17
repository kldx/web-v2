module Billplz
  class GetBill
    def self.retrieve(bill_id)
      HTTParty.get(Settings.billplz.bills.url+"/#{bill_id}",
      {
        :basic_auth => {
          :username => ENV['BILLPLZ_API_KEY']
        }
      })
    end
  end
end
