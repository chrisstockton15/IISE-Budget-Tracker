require 'rails_helper'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end

describe 'Sort Budget Request By Status', type: :system do
	it 'Sort by each type' do
		visit iise_budget_tracker_index_path
		click_on 'Create New Budget Request'
		select('submitted', :from=>'budget_request_status')
		fill_in 'budget_request_requestDescription', with: 'A'
		click_on 'Create Budget Request'

		click_on 'Create New Budget Request'
		select('processing', :from=>'budget_request_status')
		fill_in 'budget_request_requestDescription', with: 'B'
		click_on 'Create Budget Request'

		click_on 'Create New Budget Request'
		select('processed', :from=>'budget_request_status')
		fill_in 'budget_request_requestDescription', with: 'C'
		click_on 'Create Budget Request'

        expect(page).to have_content("A")
		expect(page).to have_content("B")
		expect(page).to have_content("C")

		select('submitted', :from=>'selectType')
		click_on 'Filter'
		sleep(2)
		expect(page).to have_content("A")
		#expect(page).not_to have_content("processing")
		#expect(page).to have_no_content("processed")

		select('processing', :from=>'selectType')
		click_on 'Filter'
		sleep(2)
		expect(page).to have_content("B")
		#expect(page).to have_no_content("submitted")
		#expect(page).to have_no_content("processed")

		select('processed', :from=>'selectType')
		click_on 'Filter'
		sleep(2)
		expect(page).to have_content("C")
		#expect(page).to have_no_content("submitted")
		#expect(page).to have_no_content("processing")

		select('all', :from=>'selectType')
		click_on 'Filter'
		sleep(2)
		expect(page).to have_content("A")
		expect(page).to have_content("B")
		expect(page).to have_content("C")
	end
end