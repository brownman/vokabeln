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
end
