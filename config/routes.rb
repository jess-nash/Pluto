Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pets, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :journal_entries, only: [:index, :new, :create] do
      member do
        post 'toggle_favorite', to: "journal_entries#toggle_favorite"
      end
    end
    resources :meals, only: [:index, :new, :create]
    resources :medicines, only: [:index, :new, :create]
    resources :appointments, only: [:index, :new, :create]
  end

  resources :appointments, only: [:show]
  resources :medicines, only: [:show]
  resources :ownerships, only: [:new, :create]
  # yann said remove get from resources
  get "/pets/:pet_id/profile", to: "pets#profile", as: :profile

  post "/callback", to: "line#callback"

  get "/new_pet_ownership", to: "ownerships#create_ownership_from_pet"
end
