class Counseling < ApplicationRecord
	belongs_to :industry
	belongs_to :user1
	has_many :counselinglikes, dependent: :destroy

end
