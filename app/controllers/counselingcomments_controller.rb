class CounselingcommentsController < ApplicationController
  def create
  	counseling = Counseling.find(params[:counseling_id])
	comment = current_user.counselingcomments.new(counselingcomment_params)
	comment.counseling_id = counseling.id
	comment.save
	redirect_to counseling_path(counseling)
  end
  def destroy
  	counselingcomment =Counselingcomment.find(params[:counseling_id])
  	counselingcomment.destroy
  	redirect_back(fallback_location: counselings_path)
  	end
  private
  def counselingcomment_params
  	params.require(:counselingcomment).permit(:user_id,:counseling_id,:comment)
  end
end
