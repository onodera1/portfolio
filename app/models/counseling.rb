class Counseling < ApplicationRecord
	belongs_to :industry
	belongs_to :user
	has_many :counselinglikes, dependent: :destroy
	has_many :counselingcomments,dependent: :destroy
  attachment :image

	def self.search(search)
    if search
    	Counseling.where(["title LIKE ? OR body LIKE ?","%#{search}%","%#{search}%"])
    else
      Counseling.all
    end
  end
end


