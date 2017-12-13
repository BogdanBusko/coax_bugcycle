Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :bugcycles do
    resources :suggestions, only: [:new, :create]
  end

  put '/bugcyle/:bugcycle_id/approve_suggestion/:suggestion_id', to: 'suggestions#approve', as: 'approve_suggestion'

  root 'main#index'
end
