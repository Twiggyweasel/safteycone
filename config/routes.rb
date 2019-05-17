Rails.application.routes.draw do

  get 'reports/index'
  get 'reports/show'
  get 'reports/new'
  get 'reports/create'
  get 'reports/edit'
  get 'reports/update'
  get 'reports/destroy'
  namespace :admin do
    get 'pages/dashboard'
    get 'pages/reports'
  end
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
      resources 
      resources :users do 
        resources :reports, only: [:index, :show, :new, :create]
      end
    end
  end
  
  resources :users
  resources :companies, only: [:show] do 
    resources :users
    resources :reports
  end
    
end
