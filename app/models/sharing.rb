class Sharing < ApplicationRecord
	belongs_to :industry
	belongs_to :user
	has_many :sharinglikes, dependent: :destroy
	has_many :sharingcomments, dependent: :destroy

	
end
