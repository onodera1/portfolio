class SharingLike < ApplicationRecord
	belongs_to :user
	belongs_to :sharing
	validates_uniqueness_of :sharing_id, scope: :user_id
end

