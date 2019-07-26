Rails.application.routes.draw do
  resources :article_categories
  resources :categories
  resources :user_clips
  resources :clips
  resources :articles do
    collection do
      get 'search'
    end
 end
  devise_for :users
  root 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
