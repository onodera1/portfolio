class CounselingsController < ApplicationController
    before_action :authenticate_user!, only: [:show]
  def new
    #binding.pry
  	@counseling = Counseling.new
    @industries =Industry.all
  end
  def create
    @counseling = Counseling.new(counseling_params)
    @counseling.user_id = current_user.id
    if@counseling.save
    redirect_to counselings_path
    else
      @user=current_user
      @counselings=Counseling.all
      render :new
    end
  end

  def index
  	@counselings=Counseling.all
    @counselings = Counseling.page(params[:page]).reverse_order
    @icounselings=Counseling.find(CounselingLike.group(:counseling_id).order("count(counseling_id) desc").limit(5).pluck(:counseling_id))
    #@counselinglikes=Counseling.find(Counselinglike.group(:counseling_id).order("count(counseling_id) desc").limit(5).pluck(:counseling_id))
    @counselingcommentlikes=CounselingComment.find(CounselingCommentLike.group(:counseling_comment_id).order("count(counseling_comment_id) desc").limit(5).pluck(:counseling_comment_id))
    @counseling_viewed = Counseling.order('impressions_count DESC').take(5)
      hash = CounselingCommentLike.joins(:counseling_comment).group('counseling_comments.user_id').order('count(counseling_comments.user_id) desc').size
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
    @counselinglike = CounselingLike.new
    @counselingcomment = CounselingComment.new
    @counselingcommentlike = CounselingCommentLike.new
  end

  def edit
    @counseling = Counseling.find(params[:id])
  end

  def update 
    @counseling = Counseling.find(params[:id])
    if @counseling.update(counseling_params)
    redirect_to counseling_path(@counseling.id)
    else
      @user=current_user
      render :edit
    end
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
