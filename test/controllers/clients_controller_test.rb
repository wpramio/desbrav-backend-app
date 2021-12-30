require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get clients_url, as: :json
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post clients_url, params: { client: { company_name: @client.company_name, pay_for_shipping: @client.pay_for_shipping, payment_condition: @client.payment_condition, production_capacity: @client.production_capacity, representative_id: @client.representative_id } }, as: :json
    end

    assert_response 201
  end

  test "should show client" do
    get client_url(@client), as: :json
    assert_response :success
  end

  test "should update client" do
    patch client_url(@client), params: { client: { company_name: @client.company_name, pay_for_shipping: @client.pay_for_shipping, payment_condition: @client.payment_condition, production_capacity: @client.production_capacity, representative_id: @client.representative_id } }, as: :json
    assert_response 200
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete client_url(@client), as: :json
    end

    assert_response 204
  end
end
