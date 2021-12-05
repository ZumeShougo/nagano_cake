Rails.application.routes.draw do

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }

  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    #homes
    get '/' => 'homes#top'

    #genres
    resources :genres, only:[:index, :create, :edit, :update]

    #customers
    resources :customers, only:[:index, :show, :edit, :update]

    #items
    resources :items, only:[:index, :new, :create, :show, :edit, :update]

    #orders
    get 'admin/orders/:id' => 'orders#show'
    patch '/admin/orders/:id' => 'orders#update'

    #order_detailes
    patch '/admin/orders/:order_id/order_details/:id' => 'order_detailes#update'

  end



  #public_homes
  get '/' => 'public/homes#top'
  get 'about' => 'public/homes#about'

  #public_items
  get 'items' => 'public/items#index'
  get 'items/:id' => 'public/items#show'

  #public_customers
  get 'customers/my_page' => 'public/customers#show'
  get 'customers/edit' => 'public/customers#edit'
  patch 'customers' => 'public/customers#update'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/withdraw' => 'public/customers#withdraw'

  #public_cart_items
  get 'cart_items' => 'public/cart_items#index'
  patch 'cart_items/:id' => 'public/cart_items#update'
  post 'cart_items' => 'public/cart_items#create'
  delete 'cart_items/:id' => 'public/cart_items#destroy'
  delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'

  #public_orders
  get 'orders' => 'public/orders#index'
  get 'orders/:id' => 'public/orders#show'
  get 'orders/new' => 'public/orders#new'
  post 'orders' => 'public/orders#create'
  post 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'publicorders#complete'

  #public_addresses
  get 'addresses' => 'public/addresses#index'
  get 'addresses/:id/edit' => 'public/addresses#edit'
  post 'addresses' => 'public/addresses#create'
  patch 'addresses/:id' => 'public/addresses#update'
  delete 'addresses/:id' => 'public/addresses#destroy'




end
