Rails.application.routes.draw do
  get "users/summary"
  get "favorites/create"
  get "favorites/destroy"
  get "user/summary", to: "users#summary", as: :user_summary
  devise_for :users

  resources :restaurants do
    resources :votes, only: [:create]
    resources :comments, only: [:create]
    resource :favorite, only: [:create, :destroy]

    collection do
      get :search
    end
  end

  resources :comments, only: [:destroy]

  root "restaurants#index"
end
