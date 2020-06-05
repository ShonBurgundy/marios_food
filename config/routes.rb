Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'homes#index'
  resources :products do
    resources :reviews
  end

    # USER ROUTES 
    get '/signup' => 'users#new'
    post '/users' => 'users#create'
    
    # SESSION ROUTES 
    get '/signin' => 'sessions#new'
    post '/signin' => 'sessions#create'
    get '/signout' => 'sessions#destroy'
    
end
