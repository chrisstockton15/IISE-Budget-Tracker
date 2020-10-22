class BalanceController < ApplicationController

	def index
		@balance = Balance.order(:id)
	end

	def show
		@balance = Balance.order(:id)
	end
	1
	def new
		@balance = Balance.new
	end

	def create	
		@balance = Balance.create(balance_params)
		if @balance.save
			redirect_to(iise_budget_tracker_index_path)
		else
			render('new')
		end
	end

	def edit
		@balance = Balance.find(params[:id])
	end

	def update
		@balance = Balance.find(params[:id])
		if @balance.update(balance_params)
			redirect_to(iise_budget_tracker_index_path)
		else
			render('edit')
		end
	end

	def balance_params
		params.require(:balance).permit(:balanceAmount)
	end
end
