Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/winemakers', to: 'winemakers#index'
  get '/winemakers/:id', to: 'winemakers#show'
  get '/wines', to: 'wines#index'
  get '/wines/:id', to: 'wines#show'
end
