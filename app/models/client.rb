class Client < ApplicationRecord
  has_many :client_sales, dependent: :destroy
  validates :ikizmet_client_id, uniqueness: true
end