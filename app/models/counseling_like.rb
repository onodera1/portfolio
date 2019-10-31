class CounselingLike < ApplicationRecord
	belongs_to :user
	belongs_to :counseling
	validates_uniqueness_of :counseling_id, scope: :user_id
end
