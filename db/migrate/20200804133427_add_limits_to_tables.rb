class AddLimitsToTables < ActiveRecord::Migration[6.0]
  def change
    change_column :client_sales, :revenue, :integer, limit: 8
    change_column :client_sales, :total_revenue, :integer, limit: 8
    change_column :precalculates, :revenue, :integer, limit: 8
  end
end
