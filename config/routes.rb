Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users, :only => [:show, :update]
  resources :categories do
      resources :tasks
    end

  root 'pages#home'
  get '/home' => 'pages#home'
  get '/profile' => 'pages#profile'
  get '/tasks' => 'pages#tasks'
  get '/search' => 'pages#search'
end
