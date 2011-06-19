Goals::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :goals, :only => [:create, :destroy, :show, :index] 
  resources :tasks, :only => [:create, :destroy, :show, :index]
  

  match '/about',   :to => 'pages#about'
  match '/home',   :to => 'pages#home'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
	

 end

