Rails.application.routes.draw do

  devise_for :users
	#root route
	root to: 'iise_budget_tracker#index'

	resources :iise_budget_tracker do
		member do
			get :delete
		end
	end

	resources :products do
		member do
		  get :delete
		end
	  end

	get 'iise_budget_tracker/iise_budget_tracker/new_item' => 'iise_budget_tracker#new_item', :as => :new_item

	


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
