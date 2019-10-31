class SharingComment < ApplicationRecord
	belongs_to :user
	belongs_to :sharing
end

