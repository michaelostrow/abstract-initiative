AbstractInitiative::Application.routes.draw do

  # OAUTH
  match '/users/auth/:provider/callback' => 'authentications#create'  

  authenticated :user do
    #root :to => "users#dashboard"    
  end
  root :to => 'home#index'  

  # Site stuff
  get '/about', :to => "home#about", :as => :about
  get '/404', :to => "home#404", :as => :not_found
  get '/random', :to => "home#random", :as => :random
  get '/support', :to => "home#contact", :as => :contact

  # Blog stuff
  get '/blog', :to => "blog#index", :as => :blog
  get '/blog/post', to: "blog#new", as: :new_blog  
  post '/blog/post', to: "blog#create"
  get '/blog/:month/:day/:title_slug', to: "blog#show", as: :blogpost

  # Sections
  get '/sections', :to => "sections#index", :as => :sections
  get '/section/:section_slug', to: "sections#show", as: :section

  # User account bullshit
  get '/welcome(/)', to: "home#first_login", as: "first_login"
  get '/confirming', :to => "home#confirming", :as => :confirming 
  get '/dashboard', :to => "users#dashboard", :as => :dashboard 
  devise_for :users, controllers: { confirmations: 'confirmations', registrations: 'registrations', sessions: 'sessions'}

  get '/tour(/)', to: "home#tour", as: "tour"
  put 'user/:ident', to: "users#update", as: "user_update"
  get 'users(/)', to: "users#index", as: "users"
  get 'user/:ident', to: "users#show", as: "user"
  get 'user/:ident/detail/:property', to: "users#detail", as: "user_detail"

end
