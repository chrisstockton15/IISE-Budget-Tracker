require 'rails_helper'

RSpec.describe 'Show', type: :system do
  describe 'show page' do
    it 'shows the right image name' do
        visit iise_budget_tracker_index_path
        click_on 'Create New Budget Request'
        #page.attach_file('images', "#{Rails.root}/spec/files/images/simplecov_1.JPG", make_visible: false)
        attach_file 'budget_request_images', Rails.root + "spec/files/images/simplecov_1.JPG",make_visible: true
        #find_field('Images').set("#{Rails.root}/spec/files/images/simplecov_1.JPG")
        fill_in 'budget_request_requestDescription', with: 'notUpdated Description'
        #sleep(5)
        #attach_file("Upload Receipt", Rails.root + "spec/files/images/simplecov_1.JPG")
        click_on 'Create Budget Request'
        sleep(10)
        click_on 'Edit'
        sleep(5)
        expect(page).to have_content("budget")
    end
  end
end