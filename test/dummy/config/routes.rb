# typed: strict
Rails.application.routes.draw do
  resources :posts
  root to: 'application#index'
end
