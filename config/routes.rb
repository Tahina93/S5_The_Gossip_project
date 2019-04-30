Rails.application.routes.draw do
  resources :gossips
  resources :users
  root 'gossips#index'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'hidden/:person', to: 'user#hidden', as: 'hidden_person'
end
