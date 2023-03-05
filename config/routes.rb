Rails.application.routes.draw do
  devise_for :users

  resources :dashboard, only: %i[index]
  # articles
  resources :articles, only: %i[index show new create edit update destroy] do
    resources :comments, only: %i[create]
  end
  get "my_articles", to: "articles#my_index"
  get "articles_for_validation", to: "admins#articles_for_validation"

  # locations
  resources :locations, only: %i[index create destroy]
  get 'get_coordinates_from_address', to: "locations#get_coordinates_from_address"

  # convos
  resources :convos, only: %i[index create] do
    resources :messages, only: %i[index create]
  end
  # games
  get "games", to: "pages#games"

  resources :spell_this, only: %i[index]
  resources :game_scores, only: %i[create]

  # portfolio article
  resources :portfolio_articles, only: %i[index new create destroy]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :portfolio_articles, only: %i[index]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"
end
