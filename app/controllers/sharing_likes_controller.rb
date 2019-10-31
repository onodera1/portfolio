class SharingLikesController < ApplicationController
  def create
    @sharinglike = current_user.sharing_likes.create(sharing_id: params[:sharing_id])
    @sharinglike.save
    redirect_back(fallback_location: sharings_path)
  end

  def destroy
    @sharinglike = SharingLike.find_by(sharing_id: params[:sharing_id], user_id: current_user.id)
    @sharinglike.destroy
    redirect_back(fallback_location: sharings_path)
  end
end
