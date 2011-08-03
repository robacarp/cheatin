Cheataz::Application.routes.draw do
  resources :sheets

  get 'tags' => "tags#index"
  get 'session/index'  => 'sessions#index'
  post 'session/login'  => 'sessions#login'
  get 'session/logout' => 'sessions#logout'

  # match ':controller(/:action(/:id(.:format)))'
end
