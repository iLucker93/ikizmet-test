class AddIndexToClientSales < ActiveRecord::Migration[6.0]
  def change
    add_index :client_sales, :ikizmet_client_id
    add_index :client_sales, :revenue
  end
end
