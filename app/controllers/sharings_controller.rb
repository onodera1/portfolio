class SharingsController < ApplicationController
  def new
  	@sharing = Sharing.new
  end

  def create
	  sharing = Sharing.new(sharing_params)
	  sharing.save
	  redirect_to sharings_path
  end

  def index
  	@sharings=Sharing.all
  end

  def show
    @sharing = Sharing.find(params[:id])
  end
  def edit
    @sharing = Sharing.find(params[:id])
  end

  def update
    sharing = Sharing.find(params[:id])
    sharing.update(sharing_params)
    redirect_to sharing_path(sharing.id)
  end
private
  def sharing_params
    params.require(:sharing).permit(:title, :body)
  end
end

