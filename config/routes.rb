Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  get 'posts/comparison' => 'posts#comparison'
  get 'posts/result' => 'posts#result'
  get 'posts/resultone' => 'posts#resultone'
  get 'posts/resulttwo' => 'posts#resulttwo'
  get 'posts/number' => 'posts#number'
  get 'posts/numberone' => 'posts#numberone'
  get 'posts/numbertwo' => 'posts#numbertwo'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :dances 
  root 'posts#index'


  
end
