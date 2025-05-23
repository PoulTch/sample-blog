Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  
  get 'home/index'

  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  devise_scope :user do
    get 'users/sign_in' => "devise/sessions#new"
  end

  resource :contacts, only: [:new, :create], path_names: { :new => ''}
  resources :articles do
    resources :comments, only: [:create]
  end
  resources :users do
    resources :articles
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
