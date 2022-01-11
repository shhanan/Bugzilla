Rails.application.routes.draw do

  root "sessions#new"
  resources :projects do
    member do
      patch 'assign_user'
       get 'removeuser'
      patch 'removeuser'
    end
  end

  resources :bugs do
    member do
      patch 'assign'
      put 'assign'
      patch 'change_status'
      put 'change_status'

    end
  end

resources :users
resources :project_users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #Session routes
  get "signup", to: "users#new"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  #get '/logout', to: 'sessions#destroy'
  delete 'logout', to: 'sessions#destroy '
  get '/dashboard', to: "users#index"
  get '/bugs/:id', to: 'bugs#show'
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
