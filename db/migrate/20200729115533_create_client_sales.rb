class CreateClientSales < ActiveRecord::Migration[6.0]
  def change
    create_table :client_sales do |t|
      t.integer :revenue
      t.integer :ikizmet_client_id, limit: 8, index: { unique: true }
      t.references :client, null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
