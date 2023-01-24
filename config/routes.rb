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

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
