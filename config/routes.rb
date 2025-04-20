Rails.application.routes.draw do
  devise_for :users
  resources :restaurants do
    collection do
      get 'search'
    end
    resources :votes, only: [:create]
  end

  root "restaurants#index"
end
