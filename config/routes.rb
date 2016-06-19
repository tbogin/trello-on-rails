Rails.application.routes.draw do
  
  root 'boards#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users

  resources :boards

  resources :lists

  resources :cards, except: [:index]

  resources :comments, except: [:index]
  
  get 'labels' => 'labels#new'
  post 'labels' => 'labels#create'
  delete 'labels' => 'labels#delete'

end
