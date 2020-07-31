class ClientInfoJob < ApplicationJob
  queue_as :default

  def perform
    ClientInfo.call
  end
end
