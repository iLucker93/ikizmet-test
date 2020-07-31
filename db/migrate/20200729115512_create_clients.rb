class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :client_first_name
      t.string :client_last_name
      t.integer :ikizmet_client_id, limit: 8
      t.timestamps
    end
  end
end
