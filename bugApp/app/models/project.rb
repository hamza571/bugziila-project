class Project < ApplicationRecord
	has_many :projectusers
	has_many :users , through: :projectusers, dependent: :destroy
	has_many :bugs
	
end
