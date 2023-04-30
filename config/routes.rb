Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'posts', to: 'posts#index'
  post '/posts/:id/done', to: "posts#done", as: 'done'

  resources :users, only: %i[new create]
  resources :posts
end
