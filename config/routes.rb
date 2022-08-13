Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

<<<<<<< HEAD
  resources :pets do
    resources :journal_entries, only: [:index, :new, :create]
  end

=======
  resources :pets, only: [:index, :show] do
    get "/profile", to: "pets#profile", as: :profile
    resources :journal_entries, only: [:index, :new, :create]
  end
>>>>>>> main
end
