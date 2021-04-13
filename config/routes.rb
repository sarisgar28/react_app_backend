Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :expenses
  resources :users

 

  post '/login', to: 'auth#login'
  get '/profile', to: 'auth#profile'
  
  

end
