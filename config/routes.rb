Rails.application.routes.draw do

  get '/admin', to: redirect('/admin/dashboard')
  namespace :admin, :admin => true  do
    get 'dashboard', to: 'pages#dashboard'
    get 'pages/reports'
    resources :companies do 
      resources :reports do 
        get 'success', on: :member
      end
      resources :trucks
      resources :users
    end
    resources :users, only: [:index]
    resources :reports, only: [:index]
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do 
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
