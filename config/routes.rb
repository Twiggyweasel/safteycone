Rails.application.routes.draw do

  namespace :admin, :admin => true  do
    resources :companies do 
      resources :reports
      resources :users
    end
    resources :users, only: [:index]
    resources :reports, only: [:index]
  end

  namespace :api do
    namespace :v1 do
      resources :reports, only: [:index, :show, :new, :create]
      resources :users
    end
  end
  
  resources :users
  resources :companies, only: [:show] do 
    resources :users
    resources :reports
  end
    
end
