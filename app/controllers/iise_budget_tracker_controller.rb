class IiseBudgetTrackerController < ApplicationController
  	before_action :authenticate_user!, except: [:index]
	def index
		@budget_request = BudgetRequest.order(:requestDate)
		@balance = Balance.order(:id)
		if params[:selectType] && params[:selectType] == "Date"
			@budget_request = BudgetRequest.order(:requestDate)
		end
		if params[:selectType] && params[:selectType] == "Status"
			@budget_request = BudgetRequest.order(:status)
		end
		if params[:selectType] && params[:selectType] == "Individual Name"
			@budget_request = BudgetRequest.order(:individualName)
		end
	end

	def show
		@budget_request = BudgetRequest.with_attached_images.find(params[:id])
		#send_file "#{Rails.root}/public/pdf/out.pdf"
		 
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
			@budget_request.products.destroy_all
			@budget_request.destroy
		end
			redirect_to iise_budget_tracker_index_path
	end	

	def download_pdf
		@budget_request = BudgetRequest.find(params[:id])
		filepath = "#{Rails.root}/public/pdf/out" + @budget_request.id.to_s + ".pdf"
		filename = "out" + @budget_request.id.to_s + ".pdf"
		file = File.open(filepath, "rb")
		contents = file.read
		file.close

		File.delete(filepath) if File.exist?(filepath)

		send_data(contents, :filename => filename)
	end



	def budget_request_params
		params.require(:budget_request).permit(:eventName, :accountNumber, :subAccount, :requestDate, :individualName, :phoneNumber, :mailingAddress, :uin, :paymentType, 
		:tamuAffilliation, :travelFormPassowrd, :requestDescription, :comments, :status, :totalPrice,images: [], items: [:description, :price, :quantity, :type])
	end

	def item_params
		params.require(:item).permit(:description, :price, :quantity, :type)
	end
end
