require "test_helper"

class ContactEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_event = contact_events(:one)
  end

  test "should get index" do
    get contact_events_url, as: :json
    assert_response :success
  end

  test "should create contact_event" do
    assert_difference('ContactEvent.count') do
      post contact_events_url, params: { contact_event: { client_id: @contact_event.client_id, internal_contact_id: @contact_event.internal_contact_id, occurred_at: @contact_event.occurred_at, representative_id: @contact_event.representative_id, contact_type: @contact_event.contact_type } }, as: :json
    end

    assert_response 201
  end

  test "should show contact_event" do
    get contact_event_url(@contact_event), as: :json
    assert_response :success
  end

  test "should update contact_event" do
    patch contact_event_url(@contact_event), params: { contact_event: { client_id: @contact_event.client_id, internal_contact_id: @contact_event.internal_contact_id, occurred_at: @contact_event.occurred_at, representative_id: @contact_event.representative_id, contact_type: @contact_event.contact_type } }, as: :json
    assert_response 200
  end

  test "should destroy contact_event" do
    assert_difference('ContactEvent.count', -1) do
      delete contact_event_url(@contact_event), as: :json
    end

    assert_response 204
  end
end
