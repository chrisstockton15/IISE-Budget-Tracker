Rails.application.routes.draw do
	
	#root route
	root 'iise_budget_tracker#index'

  resources :iise_budget_tracker do
		member do
			get :delete
		end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
