class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sharinglikes, dependent: :destroy
  def already_sharingliked?(sharing)
    self.sharinglikes.exists?(sharing_id: sharing.id)
  end
end
