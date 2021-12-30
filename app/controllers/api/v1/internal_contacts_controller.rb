module Api
  module V1
    class InternalContactsController < ApplicationController
      before_action :set_internal_contact, only: %i[show update destroy]

      # GET /internal_contacts
      # GET /internal_contacts.json
      def index
        @internal_contacts = InternalContact.all
      end

      # GET /internal_contacts/1
      # GET /internal_contacts/1.json
      def show
      end

      # POST /internal_contacts
      # POST /internal_contacts.json
      def create
        @internal_contact = InternalContact.new(internal_contact_params)

        if @internal_contact.save
          render :show, status: :created, location: @internal_contact
        else
          render json: @internal_contact.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /internal_contacts/1
      # PATCH/PUT /internal_contacts/1.json
      def update
        if @internal_contact.update(internal_contact_params)
          render :show, status: :ok, location: @internal_contact
        else
          render json: @internal_contact.errors, status: :unprocessable_entity
        end
      end

      # DELETE /internal_contacts/1
      # DELETE /internal_contacts/1.json
      def destroy
        @internal_contact.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_internal_contact
        @internal_contact = InternalContact.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def internal_contact_params
        params.require(:internal_contact).permit(:name, :email, :role, :phone, :client_id)
      end
    end
  end
end
