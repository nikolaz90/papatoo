Rails.application.routes.draw do
  devise_for :users

  resources :dashboard, only: %i[index]
  # articles
  resources :articles, only: %i[index show new create edit update destroy] do
    resources :comments, only: %i[create]
  end
  get "my_articles", to: "articles#my_index"
  get "articles_for_validation", to: "admins#articles_for_validation"

  # comments

  # locations
  resources :locations, only: %i[index]

  # games
  get "games", to: "pages#games"

  resources :spell_this, only: %i[index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"
end
