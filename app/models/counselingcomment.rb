class Counselingcomment < ApplicationRecord
	belongs_to :user
	belongs_to :counseling
	  has_many :counselingcommentlikes,dependent: :destroy
end

