Rails.application.routes.draw do
  resources :categories
  root 'pages#home'
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  
end
