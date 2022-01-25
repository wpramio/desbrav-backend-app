module Api
  module V1
    class ContactEventsController < ApplicationController
      before_action :set_contact_event, only: %i[show update destroy]

      # GET /contact_events
      # GET /contact_events.json
      def index
        @contact_events = ContactEvent.all
      end

      # GET /contact_events/1
      # GET /contact_events/1.json
      def show
      end

      # POST /contact_events
      # POST /contact_events.json
      def create
        @contact_event = ContactEvent.new(contact_event_params)

        if @contact_event.save
          render :show, status: :created, location: @contact_event
        else
          render json: @contact_event.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /contact_events/1
      # PATCH/PUT /contact_events/1.json
      def update
        if @contact_event.update(contact_event_params)
          render :show, status: :ok, location: @contact_event
        else
          render json: @contact_event.errors, status: :unprocessable_entity
        end
      end

      # DELETE /contact_events/1
      # DELETE /contact_events/1.json
      def destroy
        @contact_event.destroy
      end

      def orders
        @contact_event = ContactEvent.find(params[:contact_event_id])

        @orders = @contact_event.orders
        render 'api/v1/orders/index'
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_contact_event
        @contact_event = ContactEvent.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def contact_event_params
        params.require(:contact_event).permit(:contact_type, :internal_contact_id, :client_id, :representative_id, :occurred_at)
      end
    end
  end
end
