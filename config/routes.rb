Rails.application.routes.draw do
  devise_for :users   #ユーザー機能に必要な複数のルーティングを一度に生成してくれるdeviseのメソッド
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items, only: :index
end
