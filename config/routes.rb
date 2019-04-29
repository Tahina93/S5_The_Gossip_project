Rails.application.routes.draw do
  root 'gossip#index'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'gossips/add', to: 'gossip#create'
  get 'gossips/:id', to: 'gossip#show', as: "single_gossip"
  get 'hidden/:person', to: 'user#hidden', as: 'hidden_person'
  get 'users/:id', to: 'user#show', as: "single_user"
end
