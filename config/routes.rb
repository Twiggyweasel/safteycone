Rails.application.routes.draw do
  namespace :admin do
    resources :companies
    resources :users
  end

  namespace :api do
    namespace :v1 do
      get 'safetychecks/index'
    end
  end
  
  resources :users
  resources :companies, only: [:show]
end
