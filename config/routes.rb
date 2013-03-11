Myapp::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

	resources :faqs
  resources :blogs
  resources :tags
  resources :courses
  resources :topics
  resources :tutorials
  resources :groups
  resources :under_constructions
  resources :o_classes
	authenticated :user do
		root :to => 'screens#home'
	end
	root :to => 'screens#home'
	match '/about', :to => 'screens#about'
	match '/privacy', :to => 'screens#privacy'
	match '/terms', :to => 'screens#terms'
  #match '/faq', :to => 'screens#faq'
  match '/construction', :to => 'screens#construction'

  
  devise_for :users
  resources :users
  match '/auth/:provider/callback' => 'authentication#create'

  resources :courses do
    member do
      get 'comment'
    end
  end
  

  match "/courses/add_new_comment" => "courses#add_new_comment", :as => "add_new_comment_to_courses", :via => [:post] 
end