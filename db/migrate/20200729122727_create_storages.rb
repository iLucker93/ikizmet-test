class CreateStorages < ActiveRecord::Migration[6.0]
  def change
    create_table :storages do |t|
      t.json :client_info
      t.json :client_sales

      t.timestamps
    end
  end
end
