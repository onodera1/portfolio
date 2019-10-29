class TopPagesController < ApplicationController
	def top
	  @counselings=Counseling.find(Counselinglike.group(:counseling_id).order("count(counseling_id) desc").limit(5).pluck(:counseling_id))
    @counselingcomments=Counselingcomment.find(Counselingcommentlike.group(:counselingcomment_id).order("count(counselingcomment_id) desc").limit(5).pluck(:counselingcomment_id))
    



    hash = Counselingcommentlike.joins(:counselingcomment).group('counselingcomments.user_id').order('count(counselingcomments.user_id) desc').size
    users = User.find(hash.keys)
    @user_rankings = hash.values.each_with_index.map do |count, index|
      {
        rank: index + 1,
        user: users[index],
        count: count
      }
    end

    @sharings=Sharing.find(Sharinglike.group(:sharing_id).order("count(sharing_id) desc").limit(5).pluck(:sharing_id))
    @sharingstocks = Sharingstock.all
    @sharing_viewed = Sharing.order('impressions_count DESC').take(5)
    @counseling_viewed = Counseling.order('impressions_count DESC').take(5)
    @sharing_news =Sharing.order(created_at: "DESC").limit(5)
    @counseling_news =Counseling.order(created_at: "DESC").limit(5)
    #åbinding.pry
  end

  def result_index
  	@sharings = Sharing.search(params[:search])
    @counselings = Counseling.search(params[:search])
    @users = User.search(params[:search])
  end
end


