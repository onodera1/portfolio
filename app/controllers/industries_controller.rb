class IndustriesController < ApplicationController
  def new
    @industry =Industry.new
  end
  def create
    industry = Industry.new(industry_params)
    industry.save
    redirect_to industries_path
  end
  def index
  	#@industries =Industry.all
    @industries = Industry.page(params[:page]).reverse_order
  end

  def show
    @industry =Industry.find(params[:id])
    impressionist(@sharing, nil, :unique => [:session_hash])
  end
  def edit
    @industry=Industry.find(params[:id])
  end
  def update
    industry =Industry.find(params[:id])
    industry.update(industry_params)
    redirect_to industry_path(industry.id)
  end

  def destroy
    @industry = Industry.find(params[:id])
    @industry.destroy
    redirect_to industries_path
  end
private
  def industry_params
    params.require(:industry).permit(:industry_name)
  end
end
