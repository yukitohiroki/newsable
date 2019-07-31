Rails.application.routes.draw do
  resources :article_categories
  resources :categories
  resources :user_clips

  resources :clips do
    resources :opinions do
      resources :comments
    end
  end

  resources :articles do
    collection do
      get 'search'
    end
 end

  devise_for :users
  root 'home#index'
  get 'home/index'
  get "/clips/:id/opinion", to: 'clips#opinion_show', as: 'opinion_show'

end
