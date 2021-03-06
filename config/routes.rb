Rails.application.routes.draw do

  mount UserImpersonate::Engine => "/impersonate", as: "impersonate_engine"
  resources :services

  resources :providers do
    member do
      get "up_down_vote", to: "providers#up_down_vote"
      get "like", to: "providers#upvote"
      get "dislike", to: "providers#downvote"
    end
  end

  post "/search" => "welcome#search" , :as => "search"
  get 'users/my_favorites' => 'welcome#my_favorites', :as => 'my_favorites'
  get '/status' => 'welcome#submissions' , :as => 'submissions'
  get '/service/:id/approve' => 'welcome#approve' , :as => 'approve'
  get '/service/:id/disapprove' => 'welcome#disapprove' , :as => 'disapprove'
  post '/services/:id/new_service_update' => 'services#new_service_update', :as => :new_service_update
  resources :categories

  devise_for :users, :controllers => {:registrations => "registrations" , omniauth_callbacks: 'omniauth_callbacks'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
