# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

5.times do
  ProductCategory.create(
    {
      name: Faker::Commerce.unique.material,
      ref_code: Faker::Alphanumeric.alphanumeric(number: 4, min_alpha: 2, min_numeric: 2),
      description: Faker::Lorem.paragraph
    }
  )
end

ProductCategory.first(5).each do |category|
  3.times do
    Product.create(
      {
        name: Faker::Commerce.unique.product_name,
        ref_code: Faker::Alphanumeric.alphanumeric(number: 4, min_alpha: 2, min_numeric: 2),
        description: Faker::Lorem.paragraph,
        product_category: category
      }
    )
  end
end
