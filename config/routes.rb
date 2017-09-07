Rails.application.routes.draw do
  resources :users
  get 'welcome/index'

  root "welcome#index" #tutaj zmieniamy stronę główną

  resources :articles do
    resources :comments
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"

  get "/search", to: "articles#search"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
