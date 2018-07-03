Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :bugcycles do
    resources :suggestions, only: [:new, :create, :destroy]
  end

  get '/bugcycles/:category_name/:category_id', to: 'bugcycles#by_category', as: 'bugcycles_by_category'

  post '/bugcycle/:id/used/:url', to: 'bugcycles#used', as: 'used_bugcycle'

  put '/bugcycle/:bugcycle_id/approve_suggestion/:suggestion_id', to: 'suggestions#approve', as: 'approve_suggestion'
  delete '/bugcycle/:bugcycle_id/destroy_suggestion', to: 'suggestions#destroy_all', as: 'destroy_all_suggestions'

  root 'main#index'
end
