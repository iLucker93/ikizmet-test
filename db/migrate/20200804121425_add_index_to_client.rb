class AddIndexToClient < ActiveRecord::Migration[6.0]
  def change
    add_index :clients, :ikizmet_client_id
  end
end
