class TopPagesController < ApplicationController
	def top
	  @counselings=Counseling.find(CounselingLike.group(:counseling_id).order("count(counseling_id) desc").limit(5).pluck(:counseling_id))
    @counselingcomments=CounselingComment.find(CounselingCommentLike.group(:counseling_comment_id).order("count(counseling_comment_id) desc").limit(5).pluck(:counseling_comment_id))
    



    hash = CounselingCommentLike.joins(:counseling_comment).group('counseling_comments.user_id').order('count(counseling_comments.user_id) desc').size
    users = User.find(hash.keys)
    @user_rankings = hash.values.each_with_index.map do |count, index|
      {
        rank: index + 1,
        user: users[index],
        count: count
      }
    end

    @sharings=Sharing.find(SharingLike.group(:sharing_id).order("count(sharing_id) desc").limit(5).pluck(:sharing_id))
    @sharingstocks = SharingStock.all
    @sharing_viewed = Sharing.order('impressions_count DESC').take(5)
    @counseling_viewed = Counseling.order('impressions_count DESC').take(5)
    @sharing_news =Sharing.order(created_at: "DESC").limit(5)
    @counseling_news =Counseling.order(created_at: "DESC").limit(5)
    #åbinding.pry
    @industries = Industry.all
  end

  def result_index
  	@sharings = Sharing.search(params[:search])
    @counselings = Counseling.search(params[:search])
    @users = User.search(params[:search])
  end

  def industry_pages
     
      industry_id  = params[:industry_id]
      #counseling_industries = 
      @sharings = Sharing.where(industry_id: industry_id )
      @sharings = Sharing.page(params[:page]).reverse_order.per(10)
      @counselings  = Counseling.where(industry_id: industry_id)
      @counselings = Counseling.page(params[:page]).reverse_order.per(10)
  end
end


