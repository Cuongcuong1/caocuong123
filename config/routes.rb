Rails.application.routes.draw do
    resource :session
    resources :passwords, param: :token
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    root "products#index"
    resources :products do
      resources :subscribers, only: [ :create ]
    end  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
     get "/products", to: "products#index"
    resource :unsubscribe, only: [ :show ]
  
    # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
    # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
    # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  
  
  end