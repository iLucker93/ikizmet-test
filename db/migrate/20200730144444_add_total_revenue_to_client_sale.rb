class AddTotalRevenueToClientSale < ActiveRecord::Migration[6.0]
  def change
    add_column :client_sales, :total_revenue, :integer
  end
end
