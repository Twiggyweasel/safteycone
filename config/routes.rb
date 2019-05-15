Rails.application.routes.draw do

  namespace :admin do
    get 'reports/index'
    get 'reports/show'
    get 'reports/new'
    get 'reports/create'
    get 'reports/edit'
    get 'reports/update'
    get 'reports/destroy'
  end
  namespace :admin do
    resources :companies
    resources :users
    resources :reports
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
