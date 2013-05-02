ProjectFighter::Application.routes.draw do
  get "projects/index"

  devise_for :users
  root :to => 'home#index'

  namespace :admin do
    resources :users
  end
  resources :projects do
    resources :tasks do
      resources :time_records do
        member do
          put :stoptimerecord
        end
      end
      member do
        put :update_status
        post :startwork
      end
    end
  end
end
