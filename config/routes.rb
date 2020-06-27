Rails.application.routes.draw do
  root "posts#index"
  devise_for :users
  resources :users
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  resources :posts
  get "mypage" => "posts#mypage"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
