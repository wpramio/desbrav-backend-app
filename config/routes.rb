Rails.application.routes.draw do
  namespace 'api', defaults: { format: 'json' } do
    namespace 'v1' do
      resources :users do
        get 'clients'
      end
      resources :clients do
        get 'internal_contacts'
      end
      resources :internal_contacts
      resources :contact_events do
        get 'orders'
      end
      resources :orders do
        get 'items'
      end
      resources :order_items

      resources :product_categories do
        get 'products'
      end
      resources :products
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
