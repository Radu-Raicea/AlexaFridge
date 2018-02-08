Rails.application.routes.draw do
  root 'welcome#index'

  resources :recipes
  resources :ingredients

  post '/alexa' => 'skills#root'
end
