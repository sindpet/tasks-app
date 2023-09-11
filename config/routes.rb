Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :projects
  resources :tasks
  resources :tags
  # Defines the root path route ("/")
  root "tasks#index"
end
