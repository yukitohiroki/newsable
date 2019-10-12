Rails.application.routes.draw do
  resources :article_categories
  resources :categories
  resources :user_clips
  resources :articles

  resources :clips, only: [:index, :show] do
    resources :opinions do
      resources :comments
    end
    collection do
      get 'search'
    end
  end

  devise_for :users
  root 'home#index'
  get 'home/index'
  get "/clips/:id/opinion", to: 'clips#opinion_show', as: 'opinion_show'
  post '/clips/:clip_id/:opinion_id/likes', to: "likes#create", as: 'clip_opinion_like'
  delete '/clips/:clip_id/:opinion_id/likes', to: "likes#destroy", as: 'clip_opinion_likes'

end
