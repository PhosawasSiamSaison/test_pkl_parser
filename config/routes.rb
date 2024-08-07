require 'sidekiq/web'
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Secure the Sidekiq Web UI with basic authentication (optional but recommended)
  if Rails.env.development? || Rails.env.test?
    mount Sidekiq::Web => '/sidekiq'
  else
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
  resources :pkl_file_parser, only: [] do
    collection do
      # 汎用テスト用リクエスト
      post :upload
    end
  end
end
