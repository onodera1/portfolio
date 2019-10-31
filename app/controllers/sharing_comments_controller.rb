class SharingCommentsController < ApplicationController
  def create
    sharing = Sharing.find(params[:sharing_id])
    comment = current_user.sharing_comments.new(sharing_comment_params)
    comment.sharing_id = sharing.id
    comment.save
    redirect_to sharing_path(sharing)
  end

  def destroy
    sharing_comment =SharingComment.find(params[:sharing_id])
    sharing_comment.destroy
    redirect_back(fallback_location: sharings_path)
  end
private
  def sharing_comment_params
    params.require(:sharing_comment).permit(:user_id,:sharing_id,:comment)
  end
end
