ProjectFighter::Application.routes.draw do
  devise_for :users
  root :to => 'home#index'

  namespace :admin do
    resources :users
  end
end
