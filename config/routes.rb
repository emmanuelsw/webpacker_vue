Rails.application.routes.draw do
  root 'signs#index'
  get 'signs', to: 'signs#index'
end
