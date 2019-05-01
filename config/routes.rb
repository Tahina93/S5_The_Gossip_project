Rails.application.routes.draw do
  resources :gossips do
    resources :comments, except: [:index, :new, :show]
  end
  resources :users
  resources :cities
  root 'gossips#index'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'hidden/:person', to: 'user#hidden', as: 'hidden_person'
end
