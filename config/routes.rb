Myapp::Application.routes.draw do
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
end