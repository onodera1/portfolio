class SharingcommentsController < ApplicationController
 def create
    sharing = Sharing.find(params[:sharing_id])
    comment = current_user.sharingcomments.new(sharingcomment_params)
    comment.sharing_id = sharing.id
    comment.save
    redirect_to sharing_path(sharing)
end

def destroy
	sharingcomment =Sharingcomment.find(params[:sharing_id])
	sharingcomment.destroy
	redirect_back(fallback_location: sharings_path)
end
private
def sharingcomment_params
  params.require(:sharingcomment).permit(:user_id,:sharing_id,:comment)
end
end