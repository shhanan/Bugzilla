Rails.application.routes.draw do

  root "users#index"

  resources :projects do
    member do
      patch 'add_user'
      patch 'remove_user'
    end
  end

  resources :bugs do
    member do
      patch 'assign'
      patch 'start_working'
      patch 'work_done'
    end
  end

resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #Session routes
  get "signup", to: "users#new"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  #get '/logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy '
  get '/dashboard', to: "users#index"
  #get '/adduser' , to: "projects#add_user"
  #get '/projects' , to: "projects#index"
  #get '/projects/new', to: "projects#new"
  #post '/projects', to: "projects#create"
  #get '/projects/:id', to: 'projects#show'
  #get '/projects/:id/edit',to: 'projects#edit'
  #put  '/projects/:id',to: 'projects#update'
  #post '/projects/:id', to: "projects#update"
  #get "/projects/new", to: 'projects#new'

  # Defines the root path route ("/")
  
end
