require 'test_helper'

class ClientSalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_sale = client_sales(:one)
  end

  test "should get index" do
    get client_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_client_sale_url
    assert_response :success
  end

  test "should create client_sale" do
    assert_difference('ClientSale.count') do
      post client_sales_url, params: { client_sale: { client_first_name: @client_sale.client_first_name, client_id: @client_sale.client_id, client_last_name: @client_sale.client_last_name } }
    end

    assert_redirected_to client_sale_url(ClientSale.last)
  end

  test "should show client_sale" do
    get client_sale_url(@client_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_sale_url(@client_sale)
    assert_response :success
  end

  test "should update client_sale" do
    patch client_sale_url(@client_sale), params: { client_sale: { client_first_name: @client_sale.client_first_name, client_id: @client_sale.client_id, client_last_name: @client_sale.client_last_name } }
    assert_redirected_to client_sale_url(@client_sale)
  end

  test "should destroy client_sale" do
    assert_difference('ClientSale.count', -1) do
      delete client_sale_url(@client_sale)
    end

    assert_redirected_to client_sales_url
  end
end
