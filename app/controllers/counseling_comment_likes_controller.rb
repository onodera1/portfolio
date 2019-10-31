class CounselingCommentLikesController < ApplicationController
  def create
    @counselingcommentlike = current_user.counseling_comment_likes.create(counseling_comment_id: params[:counseling_comment_id])
    @counselingcommentlike.save
    redirect_back(fallback_location: counselings_path)
  end

  def destroy
    @counselingcommentlike = current_user.counseling_comment_likes.find_by(counseling_comment_id: params[:counseling_comment_id])

    # @counselingcommentlike = Counselingcommentlike.find_by(counselingcomment_id: @counselingcomment.id,id: params[:id])
    @counselingcommentlike.destroy
    redirect_back(fallback_location: counselings_path)
  end
end
