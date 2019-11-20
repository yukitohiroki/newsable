Rails.application.routes.draw do
  resources :article_categories
  resources :categories
  resources :user_clips

  resources :articles do
    resources :comments
  end

  resources :clips, only: [:index, :show] do
    resources :opinions do
      resources :likes, :comments
    end

    collection do
      get 'search'
    end
  end

  devise_for :users
  root 'home#index'
  get 'home/index'

end
