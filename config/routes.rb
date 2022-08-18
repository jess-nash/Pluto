Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pets, only: [:index, :show] do
    resources :journal_entries, only: [:index, :new, :create]
    resources :meals, only: [:index, :new, :create]
  end
  # yann said remove get from resources
  get "/pets/:pet_id/profile", to: "pets#profile", as: :profile
end
