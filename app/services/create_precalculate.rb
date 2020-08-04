class CreatePrecalculate
  include Interactor

  def call
    prepare_data.each do |obj|
      pre = Precalculate.find_or_initialize_by(type_list: obj[:type])

      if pre.total_revenue?
        full_name = 'Total revenue'
        pre.assign_attributes(full_name: full_name,
                              revenue: obj[:result],
                              type_list: obj[:type])
      else
        full_name = "#{obj[:result]&.client&.client_last_name} #{obj[:result]&.client&.client_first_name}"
        pre.assign_attributes(full_name: full_name,
                              revenue: obj[:result].revenue,
                              type_list: obj[:type])
      end
      pre.save!
    rescue ActiveRecord::RecordInvalid => e
      p e.message.to_s
    end
    p 'Precalculate successfully updated'
  end

  private

  def prepare_data
    [{type: :highest_revenue,
      result: ClientSale.joins(:client).order('total_revenue DESC').first},
     {type: :lowest_revenue,
      result: ClientSale.joins(:client).order('total_revenue DESC').last},
     {type: :least_revenue,
      result: ClientSale.order('revenue DESC').first},
     {type: :total_revenue,
      result: ClientSale.sum(:revenue)}]
  end
end