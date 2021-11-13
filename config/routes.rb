Rails.application.routes.draw do

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
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
  get '/' => 'homes#top'
  get 'about' => 'homes#about'

  #public_items
  resources :items, only:[:index, :show]

  #public_customers
  get 'customers/my_page' => 'customers#show'
  get 'customers/edit' => 'customers#edit'
  patch 'customers' => 'customers#update'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw'

  #public_cart_items
  resources :cart_items, only:[:index, :update, :create, :destroy]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'

  #public_orders
  resources :orders, only:[:index, :show, :new, :create]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'

  #public_addresses
  resources :addresses, only:[:index, :edit, :create, :update, :destroy]



end
