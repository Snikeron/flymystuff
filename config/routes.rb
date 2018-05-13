Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  
  get '/profile', to: 'profiles#show'
  get '/profile/edit', to: 'profiles#edit'
  post '/profile', to: 'profiles#create'
  patch '/profile', to: 'profiles#update'
  get '/profile/all', to: 'profiles#show_all'

  get '/address', to: 'addresses#show'
  get '/address/edit', to: 'addresses#edit'
  post '/address', to: 'addresses#create'
  patch '/address', to: 'addresses#update'
  get '/address/all', to: 'addresses#show_all'

  resources :responses
  
  resources :listings, shallow: true do 
    resources :responses
  end
  
  get '/listings_user/', to: 'listings#user_index'
  
  resources :flytes do
    member do
      post 'charge'
    end
  end
  
end
