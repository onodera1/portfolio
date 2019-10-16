class CounselingcommentslikesController < ApplicationController
  def create
    @counselingcommentlike = current_user.counselingcommentlikes.create(counselingcomment_id: params[:counselingcomment_id])
    @counselingcommentlike.save
    redirect_back(fallback_location: counselings_path)
  end

  def destroy
    @counselingcommentlike = current_user.counselingcommentlikes.find_by(counselingcomment_id: params[:counselingcomment_id])

    # @counselingcommentlike = Counselingcommentlike.find_by(counselingcomment_id: @counselingcomment.id,id: params[:id])
    @counselingcommentlike.destroy
    redirect_back(fallback_location: counselings_path)
  end
end