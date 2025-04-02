Rails.application.routes.draw do
  root "restaurants#index"

  resources :restaurants do
    collection do
      get :search
    end

    member do
      post :vote
    end
  end
end
