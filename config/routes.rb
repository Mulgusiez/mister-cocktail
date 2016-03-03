Rails.application.routes.draw do
  resources :cocktail, only: [:index, :show, :new, :destroy]

  root 'cocktails#index'
end
