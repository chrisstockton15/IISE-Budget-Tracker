describe 'Sort Budget Request By Status', type: :system do
	it 'Sort by each type' do
		visit iise_budget_tracker_index_path
		click_on 'Create New Budget Request'
		select('submitted', :from=>'status')
		click_on 'Create Budget Request'
		click_on 'Create New Budget Request'
		select('processing', :from=>'status')
		click_on 'Create Budget Request'
		click_on 'Create New Budget Request'
		select('processed', :from=>'status')
		click_on 'Create Budget Request'

        expect(page).to have_content("submitted")
		expect(page).to have_content("processing")
		expect(page).to have_content("processed")

		select('submitted', :from=>'selectType')
		click_on 'Filter'
		expect(page).to not_have_content('processing')
		expect(page).to not_have_content('processed')

		select('processing', :from=>'selectType')
		click_on 'Filter'
		expect(page).to not_have_content('submitted')
		expect(page).to not_have_content('processed')

		select('processed', :from=>'selectType')
		click_on 'Filter'
		expect(page).to not_have_content('submitted')
		expect(page).to not_have_content('processing')

		select('all', :from=>'selectType')
		click_on 'Filter'
		expect(page).to have_content('submitted')
		expect(page).to have_content('processing')
		expect(page).to have_content('processed')
	end
end