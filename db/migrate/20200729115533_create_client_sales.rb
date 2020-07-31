class CreateClientSales < ActiveRecord::Migration[6.0]
  def change
    create_table :client_sales do |t|
      t.integer :revenue
      t.integer :ikizmet_client_id, limit: 8
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
