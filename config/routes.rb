Rails.application.routes.draw do
   root "sessions#new"

  resources:users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#Session routes
get "signup", to: "users#new"
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
post '/logout', to: 'sessions#destroy'
#get '/logout', to: 'sessions#destroy'
delete 'logout', to: 'sessions#destroy '
get '/dashboard', to: "users#index"

  # Defines the root path route ("/")
  
end
