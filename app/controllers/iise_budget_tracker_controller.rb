class IiseBudgetTrackerController < ApplicationController
	def index
		@budget_request = BudgetRequest.order(:requestDate)
		if params[:selectType] && params[:selectType] == "all"
			@budget_request = BudgetRequest.order(:requestDate)
		end
		if params[:selectType] && params[:selectType] == "submitted"
			@budget_request = BudgetRequest.where(status: "submitted")
		end
		if params[:selectType] && params[:selectType] == "processing"
			@budget_request = BudgetRequest.where(status: "processing")
		end
		if params[:selectType] && params[:selectType] == "processed"
			@budget_request = BudgetRequest.where(status: "processed")
		end
	end

	def show
		@budget_request = BudgetRequest.find(params[:id])
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
		@budget_request = BudgetRequest.find(params[:id])
	end
	
	def update
		@budget_request = BudgetRequest.find(params[:id])
		if @budget_request.update(budget_request_params)
			redirect_to(iise_budget_tracker_index_path)
		else
			render('edit')
		end
	end

	def destroy 
	@budget_request = BudgetRequest.find(params[:id])
	if @budget_request.present?
		@budget_request.destroy
	end
		redirect_to iise_budget_tracker_index_path
	end	



	def budget_request_params
		params.require(:budget_request).permit(:eventName, :accountNumber, :subAccount, :requestDate, :individualName, :phoneNumber, :mailingAddress, :uin, :paymentType, 
		:tamuAffiliation, :travelFormPassword, :requestDescription, :comments, :status, :totalPrice, items: [:description, :price, :quantity, :type])
	end

	def item_params
		params.require(:item).permit(:description, :price, :quantity, :type)
	end
end
