AbstractInitiative::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  get '/about', :to => "home#about", :as => :about
  get '/news', :to => "home#about", :as => :news
  get '/artists', :to => "home#about", :as => :artists
  get '/sections', :to => "home#about", :as => :sections
  get '/random', :to => "home#about", :as => :random

  devise_for :users
  resources :users
end
