require 'rails_helper'

RSpec.describe 'Product', type: :system do
  
    describe 'create product' do
      it 'shows the correct product data in index' do
        visit iise_budget_tracker_index_path
        click_on 'Create New Budget Request'
        fill_in 'budget_request_requestDescription', with: 'Description 1'
        click_on 'Create Budget Request'
        click_on('View Items', match: :first)
        click_on 'Add New Product'
        fill_in 'product_description', with: 'Pizza'
        select 'Food', from: 'product_expense_type'
        fill_in 'product_quantity', with: '25'
        fill_in 'product_price', with: '50'
        click_on 'Create Product'
        expect(page).to have_content("Pizza")
      end
    end

    describe 'edit product' do
      it 'shows the correct product data in edit' do
        visit iise_budget_tracker_index_path
        click_on 'Create New Budget Request'
        fill_in 'budget_request_requestDescription', with: 'Description 1'
        click_on 'Create Budget Request'
        click_on('View Items', match: :first)
        click_on 'Add New Product'
        fill_in 'product_description', with: 'Pizza'
        select 'Food', from: 'product_expense_type'
        fill_in 'product_quantity', with: '25'
        fill_in 'product_price', with: '50'
        click_on 'Create Product'
        click_on 'Edit'
        fill_in 'product_description', with: 'Pizza2'
        click_on 'Update Item'
        expect(page).to have_content('Pizza2')
      end
    end

    describe 'Show product' do
      it 'shows the correct product data in show' do
        visit iise_budget_tracker_index_path
        click_on 'Create New Budget Request'
        fill_in 'budget_request_requestDescription', with: 'Description 1'
        click_on 'Create Budget Request'
        click_on('View Items', match: :first)
        click_on 'Add New Product'
        fill_in 'product_description', with: 'Pizza'
        select 'Food', from: 'product_expense_type'
        fill_in 'product_quantity', with: '25'
        fill_in 'product_price', with: '50'
        click_on 'Create Product'
        click_on 'Show'
        expect(page).to have_content('Pizza')
        expect(page).to have_content('Food')
        expect(page).to have_content('25')
        expect(page).to have_content('50')
      end
    end

    describe 'delete product' do
      it 'shows the correct product data in index' do
        visit iise_budget_tracker_index_path
        click_on 'Create New Budget Request'
        fill_in 'budget_request_requestDescription', with: 'Description 1'
        click_on 'Create Budget Request'
        click_on('View Items', match: :first)
        click_on 'Add New Product'
        fill_in 'product_description', with: 'Pizza'
        select 'Food', from: 'product_expense_type'
        fill_in 'product_quantity', with: '25'
        fill_in 'product_price', with: '50'
        click_on 'Create Product'
        click_on 'Delete'
        click_on 'Delete Product'
        expect(page).to have_no_content('Pizza')
      end
    end

    describe 'back to budgets' do
      it 'shows the budget index' do
        visit iise_budget_tracker_index_path
        click_on 'Create New Budget Request'
        fill_in 'budget_request_requestDescription', with: 'Description 1'
        click_on 'Create Budget Request'
        click_on('View Items', match: :first)
        click_on '<< Back to Requests'
        expect(page).to have_content('Description 1')
      end
    end

    
end