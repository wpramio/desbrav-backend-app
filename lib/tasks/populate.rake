namespace :db do
  desc 'Populate the DB with random test data.'
  task populate: :environment do
    create_users
    create_clients
    create_internal_contacts
    create_contact_events
    create_sample_orders
    create_quote_orders
    create_development_orders
    create_product_categories
    create_products
  end

  namespace :populate do
    desc 'Create fake users, clients, internal contacts and contact events.'
    task representative_module: :environment do
      create_users
      create_clients
      create_internal_contacts
      create_contact_events
    end

    desc 'Create fake product categories and products.'
    task catalog: :environment do
      create_product_categories
      create_products
    end

    desc 'Create fake users.'
    task users: :environment do
      create_users
    end

    desc 'Create fake clients.'
    task clients: :environment do
      create_clients
    end

    desc 'Create fake internal contacts.'
    task internal_contacts: :environment do
      create_internal_contacts
    end

    desc 'Create fake contact events.'
    task contact_events: :environment do
      create_contact_events
    end

    desc 'Create fake sample orders.'
    task sample_orders: :environment do
      create_sample_orders
    end

    desc 'Create fake quote orders.'
    task sample_orders: :environment do
      create_quote_orders
    end

    desc 'Create fake development orders.'
    task sample_orders: :environment do
      create_development_orders
    end

    desc 'Create fake product categories.'
    task product_categories: :environment do
      create_product_categories
    end

    desc 'Create fake products.'
    task products: :environment do
      create_products
    end
  end
end

def create_users
  puts '* Creating 3 users'
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
end

def create_clients
  puts '* Creating 4 clients'
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
end

def create_internal_contacts
  puts '* Creating 2 internal contacts'
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
end

def create_contact_events
  puts '* Creating 2 contact events'
  ContactEvent.create(
    [
      {
        contact_type: 'visita',
        internal_contact: InternalContact.find_by(name: 'João Contatini'),
        client: Client.find_by(company_name: 'Arezzo'),
        representative: User.find_by(name: 'Matheus Nekel'),
        occurred_at: Time.now
      },
      {
        contact_type: 'whatsapp',
        internal_contact: InternalContact.find_by(name: 'Maria Contatini'),
        client: Client.find_by(company_name: 'Beira Rio'),
        representative: User.find_by(name: 'Alessandro Cigolini'),
        occurred_at: Time.now
      }
    ]
  )
end

def create_sample_orders
  puts '* Creating 2 sample orders'
  Order.create(
    [
      {
        contact_event: ContactEvent.first,
        order_type: 'sample',
        status: 'production'
      },
      {
        contact_event: ContactEvent.second,
        order_type: 'sample',
        status: 'on-hold'
      }
    ]
  )
end

def create_quote_orders
  puts '* Creating 2 quote orders'
  Order.create(
    [
      {
        contact_event: ContactEvent.first,
        order_type: 'quote',
        status: 'production'
      },
      {
        contact_event: ContactEvent.second,
        order_type: 'quote',
        status: 'on-hold'
      }
    ]
  )
end

def create_development_orders
  puts '* Creating 2 development orders'
  Order.create(
    [
      {
        contact_event: ContactEvent.first,
        order_type: 'development',
        status: 'production'
      },
      {
        contact_event: ContactEvent.second,
        order_type: 'development',
        status: 'on-hold'
      }
    ]
  )
end

def create_product_categories(quantity = 5)
  puts "* Creating #{quantity} product categories"
  quantity.times do
    ProductCategory.create(
      {
        name: Faker::Commerce.unique.material,
        ref_code: Faker::Alphanumeric.alphanumeric(number: 4, min_alpha: 2, min_numeric: 2),
        description: Faker::Lorem.paragraph
      }
    )
  end
end

def create_products(quantity = 3, product_category: :all)
  if product_category == :all
    puts "* Creating #{quantity} products for each product category"
    ProductCategory.find_each do |category|
      quantity.times do
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
  elsif product_category.instance_of?(ProductCategory)
    puts "* Creating #{quantity} products for product category #{product_category.name}"
    quantity.times do
      Product.create(
        {
          name: Faker::Commerce.unique.product_name,
          ref_code: Faker::Alphanumeric.alphanumeric(number: 4, min_alpha: 2, min_numeric: 2),
          description: Faker::Lorem.paragraph,
          product_category: product_category
        }
      )
    end
  end
end
