Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'edit', to: 'users#edit'
  
  resources :drinks do
    put :favorite, on: :member
    resources :reviews, only: [ :new, :create]
  end
  
  resources :reviews, only: [ :destroy ]
  
  # resources :users, only: [ ] do
  #   resources :drinks, module: :users, only: :index
  # end
  
  resources :users, only: [ :show, :update ]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
