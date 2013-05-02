ProjectFighter::Application.routes.draw do
  get "projects/index"

  devise_for :users
  root :to => 'home#index'

  namespace :admin do
    resources :users
  end
  resources :projects do
    resources :tasks do
      member do
        put :update_status
      end
    end
  end
end
