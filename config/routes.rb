Rails.application.routes.draw do
  resources :bugcycles, only: [:index, :new, :create, :edit, :update, :destroy]

  root 'main#index'
end
