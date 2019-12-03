Rails.application.routes.draw do
  devise_for :users
	# get 'developer', to: 'homes#developer'
	# get 'qa', to: 'homes#qa'
	
  resources :users do
    resources :projects do
      resources :bugs do
        get '/assign_bug/', to: 'bugs#assignbug', as: 'assign_bug'
      end



      get 'assign'
      get 'assign_project/:id', to: 'projects#assignproject', as: 'assign_project'
      get 'remove_project/:id', to: 'projects#removeproject', as: 'remove_project'


    end
  end
  root 'homes#index'
	 #root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
