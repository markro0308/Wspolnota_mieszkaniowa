Rails.application.routes.draw do
  resources :resolutions
  get 'home/index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  get 'comments/index'
  get 'comments/show'
  get 'comments/new'
  get 'comments/edit'

  resources :posts do
     resources :comments, module: :posts
  end

  resources :resolutions do
    resources :comments, module: :resolutions
 end

 resources :resolutions do
    member do
      put "like" => "resolutions#upvote"
      put "unlike" => "resolutions#downvote"
    end
 end

  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
