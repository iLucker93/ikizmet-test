class CreateClient
  include Interactor
  delegate :storage_id, to: :context

  def call
    Storage.find(storage_id).client_info['data'].each do |client|
      obj = Client.find_or_initialize_by(client_first_name: client['client_first_name'],
                                         client_last_name: client['client_last_name'],
                                         ikizmet_client_id: client['client_id'])
      obj.assign_attributes(client_first_name: client['client_first_name'],
                            client_last_name: client['client_last_name'],
                            ikizmet_client_id: client['client_id'])
      obj.save!
    end
    p 'Clients successfully updated'
  rescue ActiveRecord::RecordInvalid => e
    p e.message.to_s
  end
end