Rails.application.routes.draw do

  devise_for :users
  root to: 'admin/rules#index'

  namespace :admin do
    resources :rules, only: [:index, :update] do
      collection do
        get :generate
      end
      resources :context_items, only: :create
    end
  end

end
