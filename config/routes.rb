Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users, :only => [:show, :update]
  # get '/categories/:id/tasks' => 'tasks#show'
  resources :categories do
      resources :tasks
    end

  root 'pages#home'
  get '/home' => 'pages#home'
  # get '/about' => 'pages#about'
  get '/profile' => 'pages#profile'
  get '/tasks' => 'pages#tasks'
  get '/search' => 'pages#search'
end
