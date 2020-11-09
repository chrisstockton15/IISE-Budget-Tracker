# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end

describe 'Sort Budget Request By Status', type: :system do
  it 'Sort by each type' do
    visit iise_budget_tracker_index_path
    click_on 'Sign In'
    click_on 'Sign up'

    fill_in 'Email', with: 'test@mail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    click_on 'Create New Budget Request'
    select('Submitted', from: 'budget_request_status')
    fill_in 'budget_request_requestDescription', with: 'A'
    click_on 'Create Budget Request'
    click_on '<< Back to Requests'

    click_on 'Create New Budget Request'
    select('Processing', from: 'budget_request_status')
    fill_in 'budget_request_requestDescription', with: 'B'
    click_on 'Create Budget Request'
    click_on '<< Back to Requests'

    click_on 'Create New Budget Request'
    select('Processed', from: 'budget_request_status')
    fill_in 'budget_request_requestDescription', with: 'C'
    click_on 'Create Budget Request'
    click_on '<< Back to Requests'

    expect(page).to have_content('A')
    expect(page).to have_content('B')
    expect(page).to have_content('C')

    select('Date', from: 'selectType')
    click_on 'Sort By'
    sleep(2)
    expect(page).to have_content('A')

    select('Status', from: 'selectType')
    click_on 'Sort By'
    sleep(2)
    expect(page).to have_content('B')

    select('Individual Name', from: 'selectType')
    click_on 'Sort By'
    sleep(2)
    expect(page).to have_content('C')
  end
end
