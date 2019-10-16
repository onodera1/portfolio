class Counseling < ApplicationRecord
	belongs_to :industry
	belongs_to :user
	has_many :counselinglikes, dependent: :destroy
	has_many :counselingcomments,dependent: :destroy

	def self.search(search)
    if search
    	Counseling.where(['title LIKE ?', "%#{search}%"])
    else
      Counseling.all
    end
  end
end


