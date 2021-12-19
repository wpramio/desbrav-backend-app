class ProductCategoriesController < ApplicationController
  before_action :set_product_category, only: %i[ show update destroy ]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_category_params
      params.require(:product_category).permit(:name, :ref_code, :description)
    end
end
