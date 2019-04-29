Rails.application.routes.draw do
  get 'contact', to: 'static#team'
  get 'team', to: 'static#contact'
  root 'gossip#index'
end
