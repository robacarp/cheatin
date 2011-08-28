Cheataz::Application.routes.draw do
  root :to => 'home#index'

  resources :sheets

  get 'tags' => "tags#index"
  get 'sessions/index'
  post 'sessions/login'
  get 'sessions/logout'

  get 'home/index'
  get 'home/flashme'

  # match ':controller(/:action(/:id(.:format)))'
end
