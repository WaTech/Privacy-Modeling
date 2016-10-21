Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'sessions/sessions'
  }

  root to: 'homepage#show'

  resource :dashboard, only: :show
  resources :generate_dashboard

  namespace :admin do
    get '/', to: 'rules#index'
    resources :users, only: %w(index new edit update destroy create)
    resources :personal_information_items, only: %w(index new edit update destroy create)
    resources :use_items, only: %w(index new edit update destroy create), path: 'uses'
    resources :categories, only: %w(index new edit update destroy create)
    resources :rules, only: [:index, :update] do
      collection do
        get :generate
        post :import
      end
      resources :context_items, only: [:create, :destroy, :edit, :update, :new]
    end
  end

end
