class Counselingcommentlike < ApplicationRecord
	belongs_to :user
	belongs_to :counselingcomment
	validates_uniqueness_of :counselingcomment_id, scope: :user_id
end
