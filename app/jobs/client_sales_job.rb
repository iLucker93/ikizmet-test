class ClientSalesJob < ApplicationJob
  queue_as :default

  def perform
    job = ClientSales.call
    return unless job.success?

    sleep 60
    second_job = CreateClientSale.call(storage_id: Storage.last.id)

    return unless second_job.success?

    sleep 5
    CreatePrecalculate.call
  end
end
