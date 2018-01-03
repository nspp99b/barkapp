Rails.application.routes.draw do
  root 'static_pages#home' #(creates root_path)
  get '/help', to: 'static_pages#help' #(help_path)
  get '/about', to: 'static_pages#about' #(about_path)
  get '/contact', to: 'static_pages#contact' #(contact_path)
  get '/signup', to: 'users#new'  #a signup is really creating a user object
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new' #sessions controller handles logging
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users #maybe clean up new and create routes
  resources :barks, only: [:index, :create, :edit, :update, :destroy]
  resources :parks
  resources :reviews, only: [:create, :edit, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
