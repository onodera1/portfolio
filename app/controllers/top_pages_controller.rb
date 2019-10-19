class TopPagesController < ApplicationController
	def top
	  @counselings=Counseling.find(Counselinglike.group(:counseling_id).order("count(counseling_id) desc").limit(5).pluck(:counseling_id))
    @counselingcomments=Counselingcomment.find(Counselingcommentlike.group(:counselingcomment_id).order("count(counselingcomment_id) desc").limit(5).pluck(:counselingcomment_id))
    @sharings=Sharing.find(Sharinglike.group(:sharing_id).order("count(sharing_id) desc").limit(5).pluck(:sharing_id))
    @sharingstocks = Sharingstock.all
    @sharing_viewed = Sharing.order('impressions_count DESC').take(5)
    # binding.pry


  end

  def result_index
  	@sharings = Sharing.search(params[:search])
    @counselings = Counseling.search(params[:search])
    @users = User.search(params[:search])
  end
end