Goals::Application.routes.draw do

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :goals, :only => [:create, :destroy, :show, :index] 
  resources :tasks
  

  match '/about',   :to => 'pages#about'
  match '/home',   :to => 'pages#home'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  match '/tasks/:id/finish', :to => 'tasks#finish', :as => 'finish_task'
  match '/tasks/:id/unfinish', :to => 'tasks#unfinish', :as => 'unfinish_task'
  
  match '/goals/:id/finish', :to => 'goals#finish', :as => 'finish_goal'
  match '/goals/:id/unfinish', :to => 'goals#unfinish', :as => 'unfinish_goal'

end

