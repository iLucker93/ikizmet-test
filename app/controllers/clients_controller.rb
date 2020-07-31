class ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @clients = Client.joins(:client_sales)
                     .merge(ClientSale.order(revenue: :desc)).limit(15)
    @precalculate = Precalculate.all
  end

  # test endpoint
  def create
    # ClientInfo.call
    # ClientSales.call
    # CreateClient.call(storage_id: Storage.last.id)
    # CreateClientSale.call(storage_id: Storage.last.id)
    # CreatePrecalculate.call
  end
end
