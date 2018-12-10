Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  post '/login' => "sessions#create"
  delete '/logout' => "sessions#destroy"
  get '/profile' => "users#profile"

end
