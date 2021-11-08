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
  
  
end
