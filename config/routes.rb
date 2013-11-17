AbstractInitiative::Application.routes.draw do

  # OAUTH
  match '/users/auth/:provider/callback' => 'authentications#create'  

  authenticated :user do
    root :to => "users#dashboard"
  end
  root :to => 'home#index'


  # Site stuff
  get '/about', :to => "home#about", :as => :about
  get '/blog', :to => "blog#index", :as => :blog
  get '/404', :to => "home#404", :as => :not_found
  get '/random', :to => "home#random", :as => :random
  get '/support', :to => "home#contact", :as => :contact

  # Sections
  get '/sections', :to => "home#sections", :as => :sections
  get '/section/writing', to: "writing#index", as: :writing
  get '/section/audio', to: "audio#index", as: :audio
  get '/section/music', to: "audio#index"
  get '/section/video', to: "multimedia#index"
  get '/section/multimedia', to: "multimedia#index", as: :multimedia
  get '/section/visual_art', to: "visual_art#index", as: :visual_art

  # User account bullshit
  get '/welcome(/)', to: "home#first_login", as: "first_login"
  get '/confirming', :to => "home#confirming", :as => :confirming 
  get '/dashboard', :to => "users#dashboard", :as => :dashboard 
  devise_for :users, controllers: { confirmations: 'confirmations', registrations: 'registrations', sessions: 'sessions'}

  put 'user/:ident', to: "users#update", as: "user_update"
  get 'users(/)', to: "users#index", as: "users"
  get 'user/:ident', to: "users#show", as: "user"
  get 'user/:ident/detail/:property', to: "users#detail", as: "user_detail"
  get 'profile/edit', to: "users#edit", as: "user_edit"

end
