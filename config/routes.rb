Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root "devise/sessions#new"
  end

  resource :dashboard
  resources :questions, only: [:show, :new, :create] do
    resources :answers, only: [:new, :create]
  end
end
