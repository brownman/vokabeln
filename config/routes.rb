Vokabeln::Application.routes.draw do
  root :to => "users#index"
  
  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login

  resources :sessions
  resources :users
  
  get '/search' => "vocables#search", :as => 'search'
  
  # Workaround for bug below (see http://stackoverflow.com/questions/3937823/weird-routing-error-in-rails-3-0)
  match '/users/:user_id/lessons/:lesson_id/vocables/:id/check(.:format)', :to => "vocables#check", :as => :check_user_lesson_vocable
  
  resources :users do
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
end
