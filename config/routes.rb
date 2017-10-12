Rails.application.routes.draw do

  resources :registered_application#, except :index

  devise_for :users
  root 'welcome#index'
end
