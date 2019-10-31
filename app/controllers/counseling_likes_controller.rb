class CounselingLikesController < ApplicationController
  def create
    @counselinglike = current_user.counseling_likes.create(counseling_id: params[:counseling_id])
    @counselinglike.save
    redirect_back(fallback_location: counselings_path)
  end

  def destroy
    @counselinglike = CounselingLike.find_by(counseling_id: params[:counseling_id], user_id: current_user.id)
    @counselinglike.destroy
    redirect_back(fallback_location: counselings_path)
  end
end
