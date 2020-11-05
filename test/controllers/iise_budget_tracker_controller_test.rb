# frozen_string_literal: true

require 'test_helper'

class IiseBudgetTrackerControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get iise_budget_tracker_index_url
    assert_response :success
  end
end
