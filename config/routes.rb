Rails.application.routes.draw do
  get 'team', to: 'static#team'
  get 'contact', to: 'static#contact'
  root 'gossip#index'
end
