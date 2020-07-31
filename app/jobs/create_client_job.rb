class CreateClientJob < ApplicationJob
  queue_as :default

  def perform
    CreateClient.call(storage_id: Storage.last.id)
  end
end
