class Counseling < ApplicationRecord
	belongs_to :industry
	belongs_to :user
	has_many :counseling_likes, dependent: :destroy
	has_many :counseling_comments,dependent: :destroy
  attachment :image
  is_impressionable counter_cache: true
  validates :title, length: { in: 1..10 }
  validates :body, length: { in: 1..300 }

	def self.search(search)
    if search
    	Counseling.where(["title LIKE ? OR body LIKE ?","%#{search}%","%#{search}%"])
    else
      Counseling.all
    end
  end
end


