class Bug < ApplicationRecord
	
	has_one_attached :image
	belongs_to :project
	belongs_to :developer , class_name: "User" , optional: true
	belongs_to :creator , class_name: "User"

end
