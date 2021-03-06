Rails.application.routes.draw do
  devise_for :users
  # root to: "home#index"
  root to: 'articles#index'
  resources :articles do
    resources :messages, only: [:new, :create]
    resources :reviews, only: [:index, :create]
    resources :parts, only: [:index, :show]
    # get '/articles/part/:id', to: "articles#part"
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
