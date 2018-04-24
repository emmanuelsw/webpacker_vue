Rails.application.routes.draw do
  root 'application#index'

  # Front routes
  get 'form', to: 'application#index'

  # Rails routes
  resources :signs, except: [:new, :edit]
end
