Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  resources :rooms, only: %i[show]
  # resources :places
  resources :places do
    resources :rooms, only: %i[create new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
