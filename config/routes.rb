Rails.application.routes.draw do
	
	#root route
	root 'iise_budget_tracker#index'

	resources :iise_budget_tracker do
		member do
			get :delete
		end
	end

	get 'iise_budget_tracker/new_item' => 'iise_budget_tracker#new_item', :as => :new_item
	
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
