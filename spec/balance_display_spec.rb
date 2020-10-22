require 'rails_helper'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end

describe 'Sort Budget Request By Status', type: :system do
	it 'Sort by each type' do
		visit iise_budget_tracker_index_path
		click_on 'Create New Budget Request'
		select('Submitted', :from=>'budget_request_status')
		fill_in 'budget_request_requestDescription', with: 'A'
		fill_in 'budget_request_totalPrice', with: 20
		click_on 'Create Budget Request'

		click_on 'Create New Budget Request'
		select('Processing', :from=>'budget_request_status')
		fill_in 'budget_request_requestDescription', with: 'B'
		fill_in 'budget_request_totalPrice', with: 15
		click_on 'Create Budget Request'

		click_on 'Create New Budget Request'
		select('Processed', :from=>'budget_request_status')
		fill_in 'budget_request_requestDescription', with: 'C'
		fill_in 'budget_request_totalPrice', with: 30
		click_on 'Create Budget Request'

        expect(page).to have_content("80")
		expect(page).to have_content("50")
		expect(page).to have_content("15")


	end
end