require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_customers_index_url
    assert_response :success
  end

  test "should get update" do
    get public_customers_update_url
    assert_response :success
  end
end