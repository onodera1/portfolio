class Sharing < ApplicationRecord
	belongs_to :industry
	belongs_to :user
	has_many :sharinglikes, dependent: :destroy
	has_many :sharingcomments, dependent: :destroy
	has_many :sharingstocks,dependent: :destroy

   def self.search(search)
    if search
       Sharing.where(['title LIKE ?', "%#{search}%"])
    else
       Sharing.all
    end
  end
end
