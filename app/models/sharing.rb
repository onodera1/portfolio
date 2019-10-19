class Sharing < ApplicationRecord
	belongs_to :industry
	belongs_to :user
	has_many :sharinglikes, dependent: :destroy
	has_many :sharingcomments, dependent: :destroy
	has_many :sharingstocks,dependent: :destroy
  attachment :image
  is_impressionable counter_cache: true

   def self.search(search)
    if search
       Sharing.where(["title LIKE ? OR body LIKE ?","%#{search}%","%#{search}%"])
    else
       Sharing.all
    end
  end
end
