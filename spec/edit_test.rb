require 'rails_helper'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end

describe 'Edit Budget Request', type: :system do
	it 'Change Request Description' do
		visit iise_budget_tracker_index_path
		sleep(1)
		click_on 'Create New Budget Request'
		sleep(1)
		fill_in 'budget_request_requestDescription', with: 'notUpdated Description'
		sleep(1)
		click_on 'Create Budget Request'
        sleep(1)
        expect(page).to have_content("notUpdated Description")
		sleep(1)
		click_on 'Edit'
		sleep(1)
		fill_in 'budget_request_requestDescription', with: 'Updated Description'
        sleep(1)
        click_on 'Update Budget Request'
        sleep(1)
		expect(page).to have_content("Updated Description") 
	end
end