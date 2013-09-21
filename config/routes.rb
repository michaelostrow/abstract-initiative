AbstractInitiative::Application.routes.draw do
  authenticated :user do
    root :to => "users#dashboard"
  end
  root :to => 'home#index'

  get '/about', :to => "home#about", :as => :about
  get '/news', :to => "home#news", :as => :news
  get '/artists', :to => "home#artists", :as => :artists
  get '/sections', :to => "home#sections", :as => :sections
  get '/random', :to => "home#random", :as => :random

  get '/confirming', :to => "home#confirming", :as => :confirming
  
  get '/support/feedback', :to => "home#contact", :as => :contact
 
  get '/dashboard', :to => "users#dashboard", :as => :dashboard 
  
  devise_for :users, controllers: { confirmations: 'confirmations', registrations: 'registrations' }
  devise_scope :user do
    get '/welcome', :to => "home#tour", :as => :tour
    get '/tour', :to => "home#tour2", :as => :tour2
  end
  
  resources :users, :only => [:index, :show]
  
end
