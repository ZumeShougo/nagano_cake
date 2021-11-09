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
      resources :genres, only:[:index, :create, :edit, :update]
      resources :customers, only:[:index, :show, :edit, :update]
      resources :items, only:[:index, :new, :create, :show, :edit, :update]
  end

  namespace :public do

    #homes
    get '/' => 'homes#top'
    get 'about' => 'homes#about'

    #items
    resources :items, only:[:index, :show]

    #customers
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'

    #cart_items
    resources :cart_items, only:[:index, :update, :create, :destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'

    #orders
    resources :orders, only:[:index, :show, :new, :create]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'

    #addresses
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]



  end
end
