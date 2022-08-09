Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :journal_entries, only: [:index, :new, :create]
end
