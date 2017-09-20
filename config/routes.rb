Rails.application.routes.draw do
  resources :users
  get 'welcome/index'

  root "welcome#index" #tutaj zmieniamy stronę główną

  match "/comments/:id/vote", to: "comments#vote", as: "vote_comment", via: [:get, :post]

  resources :articles do
    resources :comments

    member do
      get "preview"
    end
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#new"
  delete "/logout", to: "sessions#destroy"

  get "/search", to: "articles#search"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
