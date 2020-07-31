class ClientSalesJob < ApplicationJob
  queue_as :default

  def perform
    ClientSales.call
  end
end
