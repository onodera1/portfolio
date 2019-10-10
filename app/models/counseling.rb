class Counseling < ApplicationRecord
	belongs_to :industry
	belongs_to :user
	has_many :counselinglikes, dependent: :destroy
	has_many :counselingcomments,dependent: :destroy

end
