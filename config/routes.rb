Rails.application.routes.draw do
  resources :cards, only: [:index]
  resources :users, only: [:new, :index, :new, :create, :show]

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'  
end
