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

	resources :balance do
		member do
		  get :delete
		end  
	end

	get 'iise_budget_tracker/iise_budget_tracker/new_item' => 'iise_budget_tracker#new_item', :as => :new_item
	get 'iise_budget_tracker/download_pdf/:id', to: "iise_budget_tracker#download_pdf", as: :download_pdf
	patch 'iise_budget_tracker/change_status/:id', to: 'iise_budget_tracker#change_status', as: :change_status
	#get 'iise_budget_tracker/download_pdf/:id', to: 'sites#edit', as: :sites_edit

	


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
