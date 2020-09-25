class BudgetRequest < ApplicationRecord
	has_many :items
	has_many :products
	accepts_nested_attributes_for :items
end
