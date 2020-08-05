class CreateClientSale
  include Interactor
  delegate :storage_id, to: :context

  def call
    ActiveRecord::Base.transaction do
      Storage.find(storage_id).client_sales['data'].each do |client|
        client_id = Client.find_by(ikizmet_client_id: client['client_id']).id
        obj = ClientSale.find_or_initialize_by(ikizmet_client_id: client['client_id'],
                                               client_id: client_id)
        set_revenue = obj.revenue.nil? ? client['revenue'] : obj.revenue += client['revenue']
        obj.assign_attributes(revenue: client['revenue'],
                              total_revenue: set_revenue,
                              client_id: client_id)
        obj.save!
      end
      p 'ClientSale successfully updated'
    rescue ActiveRecord::RecordInvalid => e
      p e.message.to_s
    end
  end
end