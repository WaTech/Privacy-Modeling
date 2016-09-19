Rails.application.routes.draw do
  root to: 'admin/rules#index'

  namespace :admin do
    resources :rules, only: [:index, :update]
  end

end
