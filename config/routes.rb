Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :orders, only: [:create, :update]
  end
end
