Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/wines', to: 'wines#index'
  get '/wines/:id', to: 'wines#show'

  get '/winemakers/:winemaker_id/wines', to: 'winemaker_wines#index'

  get '/winemakers', to: 'winemakers#index'
  get '/winemakers/new', to: 'winemakers#new'
  get '/winemakers/:id', to: 'winemakers#show'
  post '/winemakers', to: 'winemakers#create'
  get '/winemakers/:id/edit', to: 'winemakers#edit'
  patch '/winemakers/:id', to: 'winemakers#update'

end
