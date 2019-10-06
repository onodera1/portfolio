class CounselingsController < ApplicationController
  def new
  	@counseling = Counseling.new
  end
  def create
    counseling = Counseling.new(counseling_params)
    counseling.save
    redirect_to counselings_path
  end

  def index
  	@counselings=Counseling.all
  end

  def show #詳細
    @counseling = Counseling.find(params[:id])
  end

  def edit
    @counseling = Counseling.find(params[:id])
  end

  def update 
    counseling = Counseling.find(params[:id])
    counseling.update(counseling_params)
    redirect_to counseling_path(counseling.id)
  end
  private
  def counseling_params
    params.require(:counseling).permit(:title, :body)
  end
end
