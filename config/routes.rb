Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :votes, only: [:create]
    resources :comments, only: [:create]

    collection do
      get :search
    end
  end

  resources :comments, only: [:destroy]

  root "restaurants#index"
end
