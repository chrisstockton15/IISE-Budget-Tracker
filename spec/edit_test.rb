# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end

describe 'Edit Budget Request', type: :system do
  it 'Change Request Description' do
    visit iise_budget_tracker_index_path
    click_on 'Sign In'
    click_on 'Sign up'

    fill_in 'Email', with: 'test@mail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    sleep(1)
    click_on 'Create New Budget Request'
    sleep(1)
    fill_in 'budget_request_requestDescription', with: 'notUpdated Description'
    sleep(1)
    click_on 'Create Budget Request'
    sleep(1)
    expect(page).to have_content('notUpdated Description')
    sleep(1)
    click_on('Edit', match: :first)
    sleep(1)
    fill_in 'budget_request_requestDescription', with: 'Updated Description'
    sleep(1)
    click_on 'Update Budget Request'
    sleep(1)
    expect(page).to have_content('Updated Description')
  end
end
