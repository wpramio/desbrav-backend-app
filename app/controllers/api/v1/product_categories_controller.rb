module Api
  module V1
    class ProductCategoriesController < ApplicationController
      before_action :set_product_category, only: %i[show update destroy]
      before_action :render_error_if_not_found, only: %i[show update destroy]

      # GET /product_categories
      # GET /product_categories.json
      def index
        @product_categories = ProductCategory.all
      end

      # GET /product_categories/1
      # GET /product_categories/1.json
      def show
      end

      # POST /product_categories
      # POST /product_categories.json
      def create
        @product_category = ProductCategory.new(product_category_params)

        if @product_category.save
          render :show, status: :created, location: @product_category
        else
          render json: @product_category.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /product_categories/1
      # PATCH/PUT /product_categories/1.json
      def update
        if @product_category.update(product_category_params)
          render :show, status: :ok, location: @product_category
        else
          render json: @product_category.errors, status: :unprocessable_entity
        end
      end

      # DELETE /product_categories/1
      # DELETE /product_categories/1.json
      def destroy
        @product_category.destroy
      end

      # GET /product_categories/:product_category_id/products
      def products
        @product_category = ProductCategory.find_by(id: params[:product_category_id]) ||
                            ProductCategory.find_by(ref_code: params[:product_category_id].to_s)

        if @product_category.nil?
          render json: { status: 404, error: 'Product category not found' },
                 status: :not_found and return
        end

        @products = @product_category.products
        render 'api/v1/products/index'
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_product_category
        @product_category = ProductCategory.find_by(id: params[:id]) ||
                            ProductCategory.find_by(ref_code: params[:id])
      end

      def render_error_if_not_found
        render json: { status: 404, error: :not_found }, status: :not_found if @product_category.nil?
      end

      # Only allow a list of trusted parameters through.
      def product_category_params
        params.require(:product_category).permit(:name, :ref_code, :description)
      end
    end
  end
end
