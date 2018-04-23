Rails.application.routes.draw do
  root 'main#index'

  # Front routes
  get 'form', to: 'main#index'

  # Rails routes
  resources :signs, except: [:new, :edit]
end
