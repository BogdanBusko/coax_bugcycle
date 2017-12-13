Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :categories, only: :show

  resources :bugcycles do
    resources :suggestions, only: [:new, :create, :destroy]
  end

  put '/bugcycle/:bugcycle_id/approve_suggestion/:suggestion_id', to: 'suggestions#approve', as: 'approve_suggestion'
  delete '/bugcycle/:bugcycle_id/destroy_suggestion', to: 'suggestions#destroy_all', as: 'destroy_all_suggestions'

  root 'main#index'
end
