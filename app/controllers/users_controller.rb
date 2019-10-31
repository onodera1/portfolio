class UsersController < ApplicationController
	def show 
      @user = User.find(params[:id])
      @counseling = Counseling.find(params[:id])
      # binding.pry
      @commentlikes_count = CounselingCommentLike.where(user_id: params[:id]).count
      @counselinglikes_count = CounselingLike.where(user_id: params[:id]).count
      @counselingcommentlikes = @user.given_counseling_links.size
      @sharinglikes =@user.given_sharing_links.size
    end
      # @user = User.find(params[:id])
      # @counseling = Counseling.find(params[:id])
      # @commentlikes = Counselingcommentlike.where(user_id: prams[:id])
      # @commentlikes_count= @commentlikes.count

  def edit
      @user = User.find(params[:id])
    end

	def update
	   @user = User.find(params[:id])
	   @user.update(user_params)
	   redirect_to user_path(@user.id)
	end

  def mysharing_pages
    @user = User.find(params[:user_id])
    #byebug
    @sharings = @user.sharings
  end

  def mycounseling_pages
    @user =User.find(params[:user_id])
    @counselings = @user.counselings
  end

  def mysharingstock_pages
    @user =User.find(params[:user_id])
    #byebug
    @sharingstocks = @user.sharing_stocks
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

	private
  def user_params
    params.require(:industry).permit(:last_name,:first_name,:nickname,:phone_number,:email,:password,:password_confirmation,:title, :body,:industry_id)
  end
end

