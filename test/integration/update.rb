require 'test_helper'

class update < Capybara::Rails::TestCase
  def setup
    @one = posts :one
    @two = posts :two
  end

  test 'Update Budget Request' do
    visit iise_budget_tracker_index_path

    click_on 'Create New Budget Request'
    visit new_iise_budget_tracker_path
    assert page.has_content?('Event Name')

    fill_in 'budget_request_requestDescription', with: 'notUpdated Description'

    click_on 'Create Budget Request'

    assert page.has_content?('notUpdated Description')

    click_on 'Edit'
    visit edit_iise_budget_tracker_path
    assert page.has_content?('Event Name')
    
    fill_in 'budget_request_requestDescription', with: 'Updated Description'

    click_on 'Update Budget Request'

    assert page.has_content?('Updated Description')
  end
end