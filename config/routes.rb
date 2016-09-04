Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  # we dont need to get all the resources of the welcome controller
  get 'welcome/index'
  # we define the welcome index controller as our root path - this will be the main/home page
  root 'welcome#index'
end
