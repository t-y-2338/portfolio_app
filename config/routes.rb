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
    resources :tasks, only: %i[create update destroy] do
      member do
        patch :completed
        patch :incomplete
      end
    end
  end
end
