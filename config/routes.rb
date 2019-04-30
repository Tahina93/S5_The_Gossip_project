Rails.application.routes.draw do
  resources :gossip
  resources :user
  root 'gossip#index'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'hidden/:person', to: 'user#hidden', as: 'hidden_person'
end
