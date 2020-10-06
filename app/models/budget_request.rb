class BudgetRequest < ApplicationRecord
	has_many :items
	has_many :products
	has_one_attached :image
	accepts_nested_attributes_for :items
end
