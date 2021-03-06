  class SharingsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def new
  	@sharing = Sharing.new
    @industries =Industry.all
  end

  def create
    flash[:notice] = "You have creatad sharing successfully"
	  @sharing = Sharing.new(sharing_params)
    #byebug
    @sharing.user_id = current_user.id
	  if @sharing.save
	    redirect_to sharings_path
    else
      @user=current_user
      render :new
    end
  end



  def index
    @sharings = Sharing.page(params[:page]).reverse_order
  	#@sharings=Sharing.all
    @sharinglikes=Sharing.find(SharingLike.group(:sharing_id).order("count(sharing_id) desc").limit(5).pluck(:sharing_id))
    @most_viewed = Sharing.order('impressions_count DESC').take(5)

  end

  def show
    @sharing = Sharing.find(params[:id])
    impressionist(@sharing, nil, :unique => [:session_hash])
    @industry =@sharing.industry
    @user = @sharing.user
    @sharinglike = SharingLike.new
    @sharingcomment = SharingComment.new
    @sharingstock = SharingStock.new
  end
  def edit
    @sharing = Sharing.find(params[:id])
  end

  def update
    @sharing = Sharing.find(params[:id])
    if @sharing.update(sharing_params)
       redirect_to sharing_path(sharing.id)
    else  @user=current_user
          render :edit
    end
  end



  def destroy
    @sharing=Sharing.find(params[:id])
    @sharing.destroy
    redirect_to sharings_path
  end
private
  def sharing_params
    params.require(:sharing).permit(:title, :body,:industry_id,:image)
  end
end