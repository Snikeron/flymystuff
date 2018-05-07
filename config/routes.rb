Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  
  get '/profile', to: 'profiles#show'
  get '/profile/edit', to: 'profiles#edit'
  post '/profile', to: 'profiles#create'
  patch '/profile', to: 'profiles#update'
  get '/profile/all', to: 'profiles#show_all'
end
