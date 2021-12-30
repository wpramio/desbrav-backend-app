# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

User.create(
  [
    {
      name: 'Matheus Nekel',
      email: 'nekel@desbrav.com',
      password: '123'
    },
    {
      name: 'Willian Pramio',
      email: 'pramio@desbrav.com',
      password: '123'
    },
    {
      name: 'Alessandro Cigolini',
      email: 'cigolini@desbrav.com',
      password: '123'
    }
  ]
)

Client.create(
  [
    {
      company_name: 'Arezzo',
      production_capacity: 'De 1000 até 2500 pares',
      pay_for_shipping: true,
      payment_condition: 'Parcelado em 12x sem juros',
      representative: User.find_by(name: 'Matheus Nekel')
    },
    {
      company_name: 'Grendene',
      production_capacity: 'De 2500 até 5000 pares',
      pay_for_shipping: false,
      payment_condition: 'À vista',
      representative: User.find_by(name: 'Matheus Nekel')
    },
    {
      company_name: 'Beira Rio',
      production_capacity: 'De 5000 até 10000 pares',
      pay_for_shipping: true,
      payment_condition: 'Parcelado em 24x sem juros',
      representative: User.find_by(name: 'Alessandro Cigolini')
    },
    {
      company_name: 'Hering',
      production_capacity: 'De 2500 até 5000 pares',
      pay_for_shipping: false,
      payment_condition: 'Parcelado em 6x sem juros'
    }
  ]
)

InternalContact.create(
  [
    {
      name: 'João Contatini',
      email: 'joao@arezzo.com',
      role: 'Gerente de Fornecedores',
      phone: '(51) 998765432',
      client: Client.find_by(company_name: 'Arezzo')
    },
    {
      name: 'Maria Contatini',
      email: 'maria@beirario.com',
      role: 'Chefe de Insumos',
      phone: '(51) 912345678',
      client: Client.find_by(company_name: 'Beira Rio')
    }
  ]
)

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
