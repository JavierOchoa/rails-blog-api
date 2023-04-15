Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/login', to: 'auth#login'
  get '/health', to: 'health#health'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts, only: [:index, :show, :create, :update]
end
