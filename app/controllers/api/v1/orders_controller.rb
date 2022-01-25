module Api
  module V1
    class OrdersController < ApplicationController
      before_action :set_order, only: %i[show update destroy]

      # GET /orders
      # GET /orders.json
      def index
        @orders = Order.all
      end

      # GET /orders/1
      # GET /orders/1.json
      def show
      end

      # POST /orders
      # POST /orders.json
      def create
        @order = Order.new(order_params)

        if @order.save
          render :show, status: :created, location: @order
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /orders/1
      # PATCH/PUT /orders/1.json
      def update
        if @order.update(order_params)
          render :show, status: :ok, location: @order
        else
          render json: @order.errors, status: :unprocessable_entity
        end
      end

      # DELETE /orders/1
      # DELETE /orders/1.json
      def destroy
        @order.destroy
      end

      def items
        @order = Order.find(params[:order_id])

        @order_items = @order.items
        render 'api/v1/order_items/index'
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def order_params
        params.require(:order).permit(:contact_event_id, :order_type, :status)
      end
    end
  end
end
