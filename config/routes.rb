Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
      get '/'  => 'homes#top'
      resources :genres, only:[:index, :create, :edit, :update]
      resources :customers, only:[:index, :show, :edit, :update]
  end
end
