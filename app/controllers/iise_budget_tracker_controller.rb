class IiseBudgetTrackerController < ApplicationController
	def index
		@budget_request = BudgetRequest.order(:requestDate)
	end

	def show
	end

	def new
		@budget_request = BudgetRequest.new
		#@budget_request.items.build
	end

	def new_item
		@item = Item.new
	end

	def create	
		#create budget_request
		@budget_request = BudgetRequest.create(budget_request_params)
		if @budget_request.save
			redirect_to(iise_budget_tracker_index_path)
		else
			render('new')
		end
	end

	def edit
	end
	
	def update
	end



	def budget_request_params
		params.require(:budget_request).permit(:eventName, :accountNumber, :subAccount, :requestDate, :individualName, :phoneNumber, :mailingAddress, :uin, :paymentType, 
		:tamuAffiliation, :travelFormPassword, :requestDescription, :comments, :status, :totalPrice, items: [:description, :price, :quantity, :type])
	end

	def item_params
		params.require(:item).permit(:description, :price, :quantity, :type)
	end
end
