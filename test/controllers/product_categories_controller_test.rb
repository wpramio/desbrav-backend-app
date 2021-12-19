require "test_helper"

class ProductCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_category = product_categories(:one)
  end

  test "should get index" do
    get product_categories_url, as: :json
    assert_response :success
  end

  test "should create product_category" do
    assert_difference('ProductCategory.count') do
      post product_categories_url, params: { product_category: { description: @product_category.description, name: @product_category.name, ref_code: @product_category.ref_code } }, as: :json
    end

    assert_response 201
  end

  test "should show product_category" do
    get product_category_url(@product_category), as: :json
    assert_response :success
  end

  test "should update product_category" do
    patch product_category_url(@product_category), params: { product_category: { description: @product_category.description, name: @product_category.name, ref_code: @product_category.ref_code } }, as: :json
    assert_response 200
  end

  test "should destroy product_category" do
    assert_difference('ProductCategory.count', -1) do
      delete product_category_url(@product_category), as: :json
    end

    assert_response 204
  end
end
