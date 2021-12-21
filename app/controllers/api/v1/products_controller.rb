module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: %i[show update destroy]
      before_action :render_error_if_not_found, only: %i[show update destroy]

      # GET /products
      # GET /products.json
      def index
        @products = Product.all
      end

      # GET /products/1
      # GET /products/1.json
      def show
      end

      # POST /products
      # POST /products.json
      def create
        @product = Product.new(product_params)

        if @product.save
          render :show, status: :created, location: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /products/1
      # PATCH/PUT /products/1.json
      def update
        if @product.update(product_params)
          render :show, status: :ok, location: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # DELETE /products/1
      # DELETE /products/1.json
      def destroy
        @product.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find_by(id: params[:id]) ||
                   Product.find_by(ref_code: params[:id])
      end

      def render_error_if_not_found
        render json: { status: 404, error: :not_found }, status: :not_found if @product.nil?
      end

      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:name, :ref_code, :description, :product_category_id)
      end
    end
  end
end
