Vokabeln::Application.routes.draw do
  root :to => "lessons#index"
  
  get '/search' => "vocables#search", :as => 'search'
  
  # Workaround for bug below (see http://stackoverflow.com/questions/3937823/weird-routing-error-in-rails-3-0)
  match '/lessons/:lesson_id/vocables/:id/check(.:format)', :to => "vocables#check", :as => :check_lesson_vocable
  
  resources :lessons do
    member do
      get 'test'
    end
    
    resources :vocables do
      member do
        get 'ask'
        # Doesn't work! Rails bug!
        #post 'check'
      end
    end
  end
  
  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
