class CounselingCommentsController < ApplicationController
  def create
  	counseling = Counseling.find(params[:counseling_id])
	comment = current_user.counseling_comments.new(counseling_comment_params)
	comment.counseling_id = counseling.id
	comment.save
	redirect_to counseling_path(counseling)
  end
  def destroy
  	counseling_comment =CounselingComment.find(params[:counseling_id])
  	counseling_comment.destroy
  	redirect_back(fallback_location: counselings_path)
  	end
  private
  def counseling_comment_params
  	params.require(:counseling_comment).permit(:user_id,:counseling_id,:comment)
  end
end
