Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/wines', to: 'wines#index'
  get '/wines/:id', to: 'wines#show'
  get '/wines/:id/edit', to: 'wines#edit'
  patch '/wines/:id', to: 'wines#update'
  delete '/wines/:id', to: 'wines#destroy'

  get '/winemakers/:winemaker_id/wines', to: 'winemaker_wines#index'
  get '/winemakers/:winemaker_id/wines/new', to: 'winemaker_wines#new'
  post '/winemakers/:winemaker_id/wines', to: 'winemaker_wines#create'

  get '/winemakers', to: 'winemakers#index'
  get '/winemakers/new', to: 'winemakers#new'
  get '/winemakers/:id', to: 'winemakers#show'
  get '/winemakers/:id/edit', to: 'winemakers#edit'
  post '/winemakers', to: 'winemakers#create'
  patch '/winemakers/:id', to: 'winemakers#update'
  delete '/winemakers/:id', to: 'winemakers#destroy'

end
