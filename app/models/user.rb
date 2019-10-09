class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sharinglikes, dependent: :destroy
  has_many :sharings, dependent: :destroy
  has_many :counselinglikes, dependent: :destroy
  has_many :counselings, dependent: :destroy

  def already_sharingliked?(sharing)
    self.sharinglikes.exists?(sharing_id: sharing.id)
  end

    def already_counselingliked?(counseling)
    self.counselinglikes.exists?(counseling_id: counseling.id)
  end
end
