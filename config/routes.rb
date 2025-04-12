Rails.application.routes.draw do
  root "restaurants#index"
  devise_for :users

  resources :restaurants do
    collection do
      get :search
    end

    member do
      post :vote
    end
  end
end
