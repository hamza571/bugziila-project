class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum  user_type: [:manager, :developer, :qa]


  	 validates :user_type, presence: true
  	has_many :projectusers
	has_many :projects , through: :projectusers , dependent: :destroy
end
