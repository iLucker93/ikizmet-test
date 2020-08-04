set :output, "log/cron.log"

every 5.minutes do
  runner 'ClientInfoJob.perform_now'
end

every 5.minutes do
  runner 'ClientSalesJob.perform_now'
end
