class Sharing < ApplicationRecord
	belongs_to :industry
	has_many :sharinglikes, dependent: :destroy
	has_many :users, through: :sharinglikes
	
end
