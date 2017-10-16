Rails.application.routes.draw do

  resources :registered_application

  get 'account' => 'account#index'

  devise_for :users
  root 'welcome#index'
end
