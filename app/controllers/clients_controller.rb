class ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @clients = Client.joins(:client_sales)
                     .select("clients.id as id, CONCAT(clients.client_first_name, ' ', clients.client_last_name)AS full_name,
                          client_sales.revenue as revenue")
                     .order("client_sales.revenue DESC").limit(15)
    @precalculate = Precalculate.all
  end

  # test endpoint
  def create
      # CreateClient.call(storage_id: Storage.last.id)
    # ClientSales.call
    # CreateClient.call(storage_id: Storage.last.id)
    # CreateClientSale.call(storage_id: Storage.last.id)
    CreatePrecalculate.call
  end
end
