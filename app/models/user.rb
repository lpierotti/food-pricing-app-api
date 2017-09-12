class User < ApplicationRecord
	has_secure_password
	has_many :userrecipes
	has_many :recipes, through: :userrecipes

end