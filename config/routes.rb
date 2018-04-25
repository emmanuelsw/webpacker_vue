Rails.application.routes.draw do
  root 'application#index'

  # Front routes
  get 'form', to: 'application#index'
  get 'signs/:id', to: 'application#index'

  # Rails routes
  namespace :api do
    resources :signs, except: [:new, :edit]
  end
  
end
