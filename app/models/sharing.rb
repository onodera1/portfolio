class Sharing < ApplicationRecord
	belongs_to :industry
	has_many :sharinglikes, dependent: :destroy
	belongs_to :user
end
