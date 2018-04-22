Rails.application.routes.draw do
  root 'signs#index'
  get 'signs', to: 'signs#index'
  post 'signs', to: 'signs#create'
end
