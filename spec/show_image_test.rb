# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show', type: :system do
  describe 'show one file' do
    it 'shows the correct image name for uploaded file' do
      visit iise_budget_tracker_index_path
      click_on 'Sign In'
      click_on 'Sign up'

      fill_in 'Email', with: 'test@mail.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_on 'Sign up'
      click_on 'Create New Budget Request'
      # page.attach_file('images', "#{Rails.root}/spec/files/images/simplecov_1.JPG", make_visible: false)
      attach_file 'budget_request_images', Rails.root + 'spec/files/images/simplecov_1.JPG'
      # find_field('Images').set("#{Rails.root}/spec/files/images/simplecov_1.JPG")
      fill_in 'budget_request_requestDescription', with: 'notUpdated Description'
      # sleep(5)
      # attach_file("Upload Receipt", Rails.root + "spec/files/images/simplecov_1.JPG")
      click_on 'Create Budget Request'
      click_on '<< Back to Requests'
      # sleep(10)
      click_on('Details', match: :first)
      # find('#Show .search').click
      # sleep(100)
      expect(page).to have_content('simplecov_1.JPG')
    end
  end

  describe 'show multiple files' do
    it 'shows the correct image names for uploaded files' do
      visit iise_budget_tracker_index_path
      click_on 'Sign In'
      click_on 'Sign up'

      fill_in 'Email', with: 'test@mail.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
      click_on 'Sign up'
      click_on 'Create New Budget Request'
      attach_file 'budget_request_images', [Rails.root + 'spec/files/images/simplecov_1.JPG', Rails.root + 'spec/files/images/simplecov_2.JPG']
      fill_in 'budget_request_requestDescription', with: 'notUpdated Description'
      click_on 'Create Budget Request'
      click_on '<< Back to Requests'
      click_on('Details', match: :first)
      expect(page).to have_content('simplecov_1.JPG')
      expect(page).to have_content('simplecov_2.JPG')
    end
  end
end
