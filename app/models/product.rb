# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :budget_request
end
