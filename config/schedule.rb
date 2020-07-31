set :output, "log/cron.log"

every 5.minutes do
  runner 'ClientInfoJob.perform_now'
end

every 6.minutes do
  runner 'CreateClientJob.perform_now'
end

every 5.minutes do
  runner 'ClientSalesJob.perform_now'
end

every 6.minutes do
  runner 'CreateClientSaleJob.perform_now'
end

every 8.minutes do
  runner 'CreatePrecalculateJob.perform_now'
end
