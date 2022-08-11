Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pets, only: [:index, :show] do
    get "/profile", to: "pets#profile", as: :profile
    resources :journal_entries, only: [:index, :new, :create]
  end

end
