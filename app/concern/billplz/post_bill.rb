module Billplz
  class PostBill
    def self.send(collection_id,description,email,name,amount,callback,redirect_url,due)
      HTTParty.post(Settings.billplz.bills.url,
      {
        :basic_auth => {
          :username => ENV['BILLPLZ_API_KEY']
        },
        :body => {
          :collection_id => collection_id,
          :description => description,
          :email => email,
          :name => name,
          :amount => amount,
          :callback_url => callback,
          :redirect_url => redirect_url,
          :due_at => due
        }
      })
    end
  end
end
