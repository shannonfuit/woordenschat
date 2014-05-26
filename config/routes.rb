Rails.application.routes.draw do
  

  resources :achievements

  resources :answers
  resources :questions
  resources :levels
  resources :users
  resources :sessions
  resources :playedlevels 

  resources :medals 
  resources :deadline_medals, controller: 'medals', type: 'DeadlineMedal' 
  resources :three_star_medals, controller: 'medals', type: 'ThreeStarMedal' 
  resources :no_hints_medals, controller: 'medals', type: 'NoHintMedal' 
  resources :twenty_five_in_row_medals, controller: 'medals', type: 'TwentyFiveInRowMedal' 
  resources :fifty_in_row_medals, controller: 'medals', type: 'FiftyInRowMedal' 
  resources :hundred_in_row_medals, controller: 'medals', type: 'HundredInRowMedal' 
  resources :hundred_medals, controller: 'medals', type: 'HundredMedal' 
  resources :thousand_medals, controller: 'medals', type: 'ThousandMedal' 
  resources :all_medals_medals, controller: 'medals', type: 'AllMedalsMedal'



  get 'page/rules'
  get 'page/about'
  get 'page/admin'
  
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => 'sessions#new'

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"



  match ':controller/:action/:id', via: [:get, :post]
  match ':controller/:action/:id.:format', via: [:get, :post]
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
