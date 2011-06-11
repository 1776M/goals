Goals::Application.routes.draw do
  resources :users

  match '/signup',  :to => 'users#new'
	
  get "pages/home"
  get "pages/about"

 end
