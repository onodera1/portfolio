class CounselingsController < ApplicationController
  def new
  	@counseling = Counseling.new
    @industries =Industry.all
  end
  def create
    counseling = Counseling.new(counseling_params)
    counseling.user_id = current_user.id
    counseling.save
    redirect_to counselings_path
  end

  def index
  	@counselings=Counseling.all
  end

  def show #詳細
    @counseling = Counseling.find(params[:id])
    @industry = @counseling.industry
    @user = @counseling.user
    @counselinglike = Counselinglike.new
    @counselingcomment = Counselingcomment.new
  end

  def edit
    @counseling = Counseling.find(params[:id])
  end

  def update 
    counseling = Counseling.find(params[:id])
    counseling.update(counseling_params)
    redirect_to counseling_path(counseling.id)
  end
  def destroy
    @counseling =Counseling.find(params[:id])
    @counseling.destroy
    redirect_to counselings_path
  end

  private
  def counseling_params
    params.require(:counseling).permit(:title, :body,:industry_id)
  end
end
