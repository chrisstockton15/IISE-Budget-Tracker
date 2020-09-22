class IiseBudgetTrackerController < ApplicationController
	def index
		@budget_request = BudgetRequest.order(:requestDate)
	end

	def show
	end

	def new
		@budget_request = BudgetRequest.new
	end

	def create	
		@budget_request = BudgetRequest.create(budget_request_params)
		if @budget_request.save
			redirect_to(iise_budget_tracker_index_path)
		else
			render('edit')
		end
	end

	def edit
		@budget_request = BudgetRequest.find(params[:id])
	end
	
	def update
		@budget_request = BudgetRequest.find(params[:id])
		if @budget_request.update(budget_request_params)
			redirect_to(isse_budget_tracker_index_path)
		else
			render('edit')
		end
	end



	def budget_request_params
		params.require(:budget_request).permit(:accountNumber, :subAccount, :requestDate, :individualName, :phoneNumber, :mailingAddress, :paymentType, 
		:tamuAffiliation, :travelFormPassword, :requestDescription, :comments, :status)
	end
end
