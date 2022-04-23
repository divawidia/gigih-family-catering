Rails.application.routes.draw do
  root 'pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  namespace :api do
    namespace :v1 do
      resources :menus
      resources :categories
      resources :customers
      resources :orders, only: %i[index show create update]
    end
  end

  get '*path', to: 'pages#index', via: :all
end
