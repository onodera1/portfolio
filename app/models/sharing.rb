class Sharing < ApplicationRecord
	belongs_to :industry
	belongs_to :user
	has_many :sharing_likes, dependent: :destroy
	has_many :sharing_comments, dependent: :destroy
	has_many :sharing_stocks,dependent: :destroy
  attachment :image
  is_impressionable counter_cache: true
  validates :title, length: { in: 1..10 }
  validates :body, length: { in: 1..300 }

   def self.search(search)
    if search
       Sharing.where(["title LIKE ? OR body LIKE ?","%#{search}%","%#{search}%"])
    else
       Sharing.all
    end
  end
end
