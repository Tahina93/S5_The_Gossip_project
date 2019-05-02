Rails.application.routes.draw do
  resources :gossips do
    resources :comments, except: [:index, :new, :show]
    resources :likes, only: [:create, :destroy]
  end
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
  root 'gossips#index'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'hidden/:person', to: 'user#hidden', as: 'hidden_person'
end
