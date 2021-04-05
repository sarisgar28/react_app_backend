Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :expenses
  end
 

  post '/login', to: 'auth#login'
  get '/profile', to: 'auth#profile'

  

end
