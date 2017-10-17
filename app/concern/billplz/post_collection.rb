module Billplz
  class PostCollection
    def self.send(title)
      HTTParty.post(Settings.billplz.collections.url,
      {
        :basic_auth => {
          :username => ENV['BILLPLZ_API_KEY']
        },
        :body => {
          :title => title
        }
      })
    end
  end
end
