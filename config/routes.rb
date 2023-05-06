Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  resources :users, only: %i[new create]
  resources :posts do
    member do
      post :done
    end
    resources :memos, only: %i[create edit update destroy]
  end
end
