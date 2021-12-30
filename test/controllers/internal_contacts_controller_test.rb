require "test_helper"

class InternalContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @internal_contact = internal_contacts(:one)
  end

  test "should get index" do
    get internal_contacts_url, as: :json
    assert_response :success
  end

  test "should create internal_contact" do
    assert_difference('InternalContact.count') do
      post internal_contacts_url, params: { internal_contact: { client_id: @internal_contact.client_id, email: @internal_contact.email, name: @internal_contact.name, phone: @internal_contact.phone, role: @internal_contact.role } }, as: :json
    end

    assert_response 201
  end

  test "should show internal_contact" do
    get internal_contact_url(@internal_contact), as: :json
    assert_response :success
  end

  test "should update internal_contact" do
    patch internal_contact_url(@internal_contact), params: { internal_contact: { client_id: @internal_contact.client_id, email: @internal_contact.email, name: @internal_contact.name, phone: @internal_contact.phone, role: @internal_contact.role } }, as: :json
    assert_response 200
  end

  test "should destroy internal_contact" do
    assert_difference('InternalContact.count', -1) do
      delete internal_contact_url(@internal_contact), as: :json
    end

    assert_response 204
  end
end
