class CreateClientSaleJob < ApplicationJob
  queue_as :default

  def perform
    CreateClientSale.call(storage_id: Storage.last.id)
  end
end
