class CounselingCommentLike < ApplicationRecord
	belongs_to :user
	belongs_to :counseling_comment
	validates_uniqueness_of :counseling_comment_id, scope: :user_id
end
