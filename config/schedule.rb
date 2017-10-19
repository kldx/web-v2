set :output, "#{path}/log/cron_log.log"
env :PATH, ENV['PATH']

every :day, :at => '12:00am' do
  rake "delete_bill:each_order"
end
