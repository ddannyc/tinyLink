Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  resources :links, only: %i[show create]
  get :code, path: '/:code', to: 'home#url_code', constraints: ->(request) { !request.xhr? }
  namespace :admin do
    resources :links, only: %i[update show]
  end
end
