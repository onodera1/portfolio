class CounselingComment < ApplicationRecord
    belongs_to :user
	belongs_to :counseling
	has_many :counseling_comment_likes,dependent: :destroy
end

