class CounselingsController < ApplicationController
  def new
    #binding.pry
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
    @counselings = Counseling.page(params[:page]).reverse_order
    @icounselings=Counseling.find(Counselinglike.group(:counseling_id).order("count(counseling_id) desc").limit(5).pluck(:counseling_id))
    #@counselinglikes=Counseling.find(Counselinglike.group(:counseling_id).order("count(counseling_id) desc").limit(5).pluck(:counseling_id))
    @counselingcommentlikes=Counselingcomment.find(Counselingcommentlike.group(:counselingcomment_id).order("count(counselingcomment_id) desc").limit(5).pluck(:counselingcomment_id))
    @counseling_viewed = Counseling.order('impressions_count DESC').take(5)
      hash = Counselingcommentlike.joins(:counselingcomment).group('counselingcomments.user_id').order('count(counselingcomments.user_id) desc').size
      users = User.find(hash.keys)
      @user_rankings = hash.values.each_with_index.map do |count, index|
        {
          rank: index + 1,
          user: users[index],
          count: count
        }
      end
    
  end


  def show #詳細
    @counseling = Counseling.find(params[:id])
    impressionist(@counseling, nil, :unique => [:session_hash])
    @industry = @counseling.industry
    @user = @counseling.user
    @counselinglike = Counselinglike.new
    @counselingcomment = Counselingcomment.new
    @counselingcommentlike = Counselingcommentlike.new
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
    params.require(:counseling).permit(:title, :body,:industry_id,:image)
  end
end
