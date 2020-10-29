class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_budget_request
  before_action :find_budget_requests, :only => [:new, :create, :edit, :update]

  def index
    @products = @budget_request.products.order(:description)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new(:budget_request_id => @budget_request.id)
  end

  def create
    #Instantiate new object using form parameters
    
    @product = Product.new(product_params)
    @product.budget_request_id = @budget_request.id
    puts @product.budget_request_id
    if @product.save
      #redirect to index if successful
      flash[:notice] = "Product created successfully"
      redirect_to(products_path(:budget_request_id => @budget_request.id))
    else
      puts "Not working"
      render('new')
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    #Find new object using form parameters
    @product = Product.find(params[:id])
    #Update the object
    if @product.update_attributes(product_params)
      #Redirect to index
      flash[:notice] = "Product updated successfully"
      redirect_to(products_path(@product,:budget_request_id => @budget_request.id))
    else
      render('edit')
    end
  end

  def delete
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product '#{@product.description}' deleted successfully"
    redirect_to(products_path(:budget_request_id => @budget_request.id))
  end



  private

  def product_params
    params.require(:product).permit(:budget_request_id,:description,:price,:quantity,:expense_type,:permalink)
  end

  def find_budget_request
    @budget_request = BudgetRequest.find(params[:budget_request_id])
  end

  def find_budget_requests
    @budget_requests = BudgetRequest.order(:requestDate)
  end

end
