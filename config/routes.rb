Rails.application.routes.draw do
  resources :recipes
  resources :ingredients

  post '/' => 'skills#root', :as => :root
end
