Rails.application.routes.draw do

  resources :registered_applications

  get 'account' => 'registered_applications#index'

  devise_for :users
  root 'welcome#index'
end
