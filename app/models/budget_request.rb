class BudgetRequest < ApplicationRecord
	has_many :items
	has_many :products
	has_many_attached :images
	accepts_nested_attributes_for :items
end
