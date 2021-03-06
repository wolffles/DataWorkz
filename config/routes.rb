Rails.application.routes.draw do


  resources :registered_applications do
    member do
      get 'event_names'
      get 'event_name'
    end
  end


  get 'account' => 'registered_applications#index'


  namespace :api, defaults:{ formats: :JSON } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
   end



  devise_for :users
  root 'welcome#index'
end
