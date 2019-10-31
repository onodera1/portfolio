class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sharings, dependent: :destroy
  has_many :sharing_likes, dependent: :destroy
  has_many :sharing_comments,dependent: :destroy
  has_many :sharing_stocks,dependent: :destroy

  has_many :counselings, dependent: :destroy
  has_many :counseling_likes, dependent: :destroy
  has_many :counseling_comments,dependent: :destroy
  has_many :counseling_comment_likes,dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  attachment :image
  has_many :given_counseling_links, class_name: "CounselingCommentLike", through: :counseling_comments, source: :counseling_comment_likes
  has_many :given_sharing_links, class_name: "SharingLike", through: :sharings, source: :sharing_likes


  validates :last_name, length: { minimum: 1 }
  validates :nickname, length: { minimum: 1 }
  validates :phone_number, length: { minimum: 1 }
  validates :email, length: { minimum: 1 }



  def self.search(search)
    if search
      User.where(['nickname LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end


 def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def already_sharing_liked?(sharing)
    self.sharing_likes.exists?(sharing_id: sharing.id)
  end
    def already_sharing_stocked?(sharing)
    self.sharing_stocks.exists?(sharing_id: sharing.id)
  end

    def already_counseling_liked?(counseling)
    self.counseling_likes.exists?(counseling_id: counseling.id)
  end


    def already_counseling_comment_liked?(counseling_comment)
    self.counseling_comment_likes.exists?(counseling_comment_id: counseling_comment.id)
  end
end
