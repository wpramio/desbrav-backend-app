# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

5.times do
  ProductCategory.create(
    {
      name: Faker::Commerce.unique.material,
      ref_code: Faker::Alphanumeric.alphanumeric(number: 4),
      description: Faker::Lorem.paragraph
    }
  )
end
