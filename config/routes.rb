Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/winemakers', to: 'winemakers#index'
  get '/winemakers/new', to: 'winemakers#new'
  get '/winemakers/:id', to: 'winemakers#show'
  get '/wines', to: 'wines#index'
  get '/wines/:id', to: 'wines#show'
  get '/winemakers/:winemaker_id/wines', to: 'winemaker_wines#index'
  post '/winemakers', to: 'winemakers#create'
end
