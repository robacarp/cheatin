Cheataz::Application.routes.draw do
  root :to => 'home#index'

  get '/languages(/search)' => 'sheets#languages'
  get '/languages/:search' => 'sheets#language'
  resources :sheets

  get 'tags' => "tags#index"

  get 'sessions/index',  :as => 'sign_in'
  post 'sessions/login', :as => 'session_begin' #good name??
  get 'sessions/logout', :as => 'sign_out'

  get 'home/index'
  get 'home/flashme'

  #pretty urls
  get 'about'        => 'home#index', :as => 'about'
  get 'users/(:user)'  => 'home#index', :as => 'user_profile'

  # default route
  # match ':controller(/:action(/:id(.:format)))'
end
