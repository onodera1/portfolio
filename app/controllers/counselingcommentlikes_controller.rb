class CounselingcommentlikesController < ApplicationController
	def create
    @counselingcommentlike = current_user.counselingcommentlikes.create(counselingcomment_id: params[:counselingcomment_id])
    @counselingcommentlike.save
    redirect_back(fallback_location: counselings_path)
  end

  def destroy
    @counselingcommentlike = Counselingcommentlike.find_by(counselingcomment_id: params[:counselingcommment_id],
                                                            id: params[:id],
                                                            user_id: current_user.id)
    @counselingcommentlike.destroy
    redirect_back(fallback_location: counselings_path)
  end
end

