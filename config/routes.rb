Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :votes, only: [:create]

    collection do
      get :search
    end
  end
  root "restaurants#index"
end
