require "application_system_test_case"

class ClientSalesTest < ApplicationSystemTestCase
  setup do
    @client_sale = client_sales(:one)
  end

  test "visiting the index" do
    visit client_sales_url
    assert_selector "h1", text: "Client Sales"
  end

  test "creating a Client sale" do
    visit client_sales_url
    click_on "New Client Sale"

    fill_in "Client first name", with: @client_sale.client_first_name
    fill_in "Client", with: @client_sale.client_id
    fill_in "Client last name", with: @client_sale.client_last_name
    click_on "Create Client sale"

    assert_text "Client sale was successfully created"
    click_on "Back"
  end

  test "updating a Client sale" do
    visit client_sales_url
    click_on "Edit", match: :first

    fill_in "Client first name", with: @client_sale.client_first_name
    fill_in "Client", with: @client_sale.client_id
    fill_in "Client last name", with: @client_sale.client_last_name
    click_on "Update Client sale"

    assert_text "Client sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Client sale" do
    visit client_sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Client sale was successfully destroyed"
  end
end
