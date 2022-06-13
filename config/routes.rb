Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :discussions, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :posts, only: [:create, :show, :edit, :update, :destroy], module: :discussions

    collection do
      get 'category/:id', to: "categories/discussions#index", as: :category
    end

    resources :notifications, only: :create, module: :discussions
  end
  root "main#index"
end
