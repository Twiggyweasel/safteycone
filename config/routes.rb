Rails.application.routes.draw do

  get '/admin', to: redirect('/admin/dashboard')
  namespace :admin, :admin => true  do
    get 'dashboard', to: 'pages#dashboard'
    get 'pages/reports'
    resources :companies do 
      get 'toggle_app_access', on: :member
      get 'toggle_admin_access', on: :member
      get 'toggle_company_status', on: :member
      resources :reports do 
        get 'success', on: :member
      end
      resources :trucks do 
        get 'toggle_status', on: :member
      end
      resources :assets
      resources :users
    end
    resources :users, only: [:index]
    resources :reports, only: [:index]
    resources :defects
  end

  namespace :api, :defaults => {:format => :json}  do
    namespace :v1 do
      resources :users, only: [:show] do 
        resources :reports, only: [:index, :show, :create]
      end
    end
  end
  
  resources :companies, only: [:show] do 
    resources :users
    resources :reports
    resources :assets
  end
    
end
