class Recipe < ApplicationRecord
	has_many :userrecipes
	has_many :users, through: :userrecipes
end