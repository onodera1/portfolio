class SharingsController < ApplicationController
  def new
  	@sharing = Sharing.new
    @industries =Industry.all
  end

  def create
	  @sharing = Sharing.new(sharing_params)
    #byebug
    @sharing.user_id = current_user.id
	  @sharing.save!
	  redirect_to sharings_path
  end


  def index
  	@sharings=Sharing.all
  end

  def show
    @sharing = Sharing.find(params[:id])
    @industry =@sharing.industry
    @user = @sharing.user
    @sharinglike = Sharinglike.new
    @sharingcomment = Sharingcomment.new
    @sharingstock = Sharingstock.new
  end
  def edit
    @sharing = Sharing.find(params[:id])
  end

  def update
    sharing = Sharing.find(params[:id])
    sharing.update(sharing_params)
    redirect_to sharing_path(sharing.id)
  end
  def destroy
    @sharing=Sharing.find(params[:id])
    @sharing.destroy
    redirect_to sharings_path
  end
private
  def sharing_params
    params.require(:sharing).permit(:title, :body,:industry_id)
  end
end

