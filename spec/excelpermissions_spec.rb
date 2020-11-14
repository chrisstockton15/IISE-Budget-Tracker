require 'rails_helper'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end

describe 'Dont Show Download Link Without Signin', type: :system do
	it 'doesnt list link' do
		visit iise_budget_tracker_index_path
		expect(page).not_to have_content("Export to Excel")
	end
end


describe 'Dont Show Download Link For Officer Signin', type: :system do
	it 'doesnt list link' do
		
		visit iise_budget_tracker_index_path
		click_on 'Sign In'
		click_on 'Sign up'
		fill_in 'user_email', with: 'officer1@iise'
		fill_in 'user_password', with: 'tempPassword1'
		fill_in 'user_password_confirmation', with: 'tempPassword1'
		click_on 'Sign up'
		expect(page).not_to have_content("Export to Excel")
	end
end

describe 'Show Download Link For Admin Signin', type: :system do
	it 'lists link' do
		
		visit iise_budget_tracker_index_path
		click_on 'Sign In'
		click_on 'Sign up'
		fill_in 'user_email', with: 'admin1@iise'
		fill_in 'user_password', with: 'tempPassword1'
		fill_in 'user_password_confirmation', with: 'tempPassword1'
		click_on 'Sign up'
		expect(page).to have_content("Export to Excel")
	end
end