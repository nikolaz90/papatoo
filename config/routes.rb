Rails.application.routes.draw do
  devise_for :users

  resources :dashboard, only: %i[index]
  # articles
  resources :articles, only: %i[index new create]
  get "my_articles", to: "articles#my_index"

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
