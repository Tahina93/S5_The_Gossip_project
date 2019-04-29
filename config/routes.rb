Rails.application.routes.draw do
  root 'gossip#index'
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  get 'gossips/:id', to: 'gossip#show'
end
