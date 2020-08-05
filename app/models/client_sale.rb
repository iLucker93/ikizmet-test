class ClientSale < ApplicationRecord
  belongs_to :client
  validates :ikizmet_client_id, uniqueness: true
end
