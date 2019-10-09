class SharinglikesController < ApplicationController
  def create
    @sharinglike = current_user.sharinglikes.create(sharing_id: params[:sharing_id])
    @sharinglike.save
    redirect_back(fallback_location: sharings_path)
  end

  def destroy
    @sharinglike = Sharinglike.find_by(sharing_id: params[:sharing_id], user_id: current_user.id)
    @sharinglike.destroy
    redirect_back(fallback_location: sharings_path)
  end
end

