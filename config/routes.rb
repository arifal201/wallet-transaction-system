Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/users', to: 'users#create'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/price', to: 'prices#price'
  get '/prices', to: 'prices#prices'
  get '/price_all', to: 'prices#price_all'
  get '/autocomplete/price', to: 'prices#autocomplete_price'

  patch '/topup', to: 'wallets#wallet_topup'
  get '/wallet/:id', to: 'wallets#show'

  post '/transactions/create', to: 'transactions#create'
end
