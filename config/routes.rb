Rails.application.routes.draw do
  scope "(:locale)", locale: /en|cs/ do
    devise_for :users
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    resources :projects
    get "projects/:project_id/tasks", to: "tasks#index", as: :projects_tasks
    resources :tasks
    resources :tags

    get "/search", to: "search#index"
    # Defines the root path route ("/")
    root "tasks#index"
  end
end
