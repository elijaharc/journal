Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]
  # get '/categories/:id/tasks' => 'tasks#show'
  resources :categories do
      resources :tasks
    end

  root 'pages#home'
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/profile' => 'pages#profile'
end
