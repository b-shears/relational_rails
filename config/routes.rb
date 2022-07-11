Rails.application.routes.draw do
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/breweries/new', to: 'breweries#new'
  get '/breweries', to: 'breweries#index'
  get '/breweries/:id', to: 'breweries#show'
  get '/beers', to: 'beers#index'
  get '/beers/:id', to: 'beers#show'
  get '/breweries/:brewery_id/beers', to: 'brewery_beers#index'
  get '/breweries/new', to: 'breweries#new'
  post '/breweries', to: 'breweries#create'
end
