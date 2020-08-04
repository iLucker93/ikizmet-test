# frozen_string_literal: true

class ClientInfoJob < ApplicationJob
  queue_as :default

  def perform
    job = ClientInfo.call
    return unless job.success?

    sleep 60
    CreateClient.call(storage_id: Storage.last.id)
  end
end
