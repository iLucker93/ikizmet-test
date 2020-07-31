class ClientInfo
  include Interactor

  require 'rest-client'
  require 'json'

  def call
    set_storage_obj

    body = valid_address(Storage::CLIENT_INFO)
    hash = JSON.parse(body)
    if @storage.update!(client_info: hash)
      p 'Storage.client_info successfully updated'
    else
      p @storage.message.to_s
    end
  rescue ActiveRecord::RecordInvalid => e
    p e.message.to_s
  end

  private

  def set_storage_obj
    @storage = Storage.last || Storage.create
  end

  def valid_address(url)
    RestClient.get(url)
  rescue RestClient::ExceptionWithResponse => e
    context.fail!(message: e.response)
  end
end
