class TopPagesController < ApplicationController
	def top
	  @counselings=Counseling.find(Counselinglike.group(:counseling_id).order("count(counseling_id) desc").limit(5).pluck(:counseling_id))
    @aaa = Counselingcommentlike.group(:counselingcomment_id).order("count(counselingcomment_id) desc").limit(5).pluck(:counselingcomment_id)
    #@bbb = Counselingcommentlike.select("user_id, count(counselingcomment_id) as like").group(:user_id).order("like desc")
    #@bbb = Counselingcommentlike.select("*,count(user_id) as like").group(:user_id).order("like desc")
    @bbb = User.joins(:counselingcommentlikes).group("users.id").count("counselingcommentlikes.id") #.order("like desc")
    #1@counselingcommentlikes = current_user.given_counseling_links.size
    #@bbb= Counselingcomment.joins(:counselingcommentlikes).group("counselingcomments.user_id").count() #.order("ounselingcommentlikes.id")
    #@bbb = Hash[@bbb.sort_by{|__, v| -v}]

    #@bbb= Counselingcomment.all.left_joins(:counselingcommentlikes).group("counselingcommentlikes.user_id").select('counselingcomments.*, COUNT(`counselingcommentlikes.user_id`) AS like') .order("ounselingcommentlikes.id")
    #@bbb = Hash[@bbb.sort_by{|__, v| -v}]
    #select count(*) as like, user_id from counselingcommentlikes group by user_id order by like DESC;

    @counselingcomments=Counselingcomment.find(Counselingcommentlike.group(:counselingcomment_id).order("count(counselingcomment_id) desc").limit(5).pluck(:counselingcomment_id))
    
    #1@sharinglikes = current_user.given_sharing_links.size
  

     # @bbb = Counselingcomment.select('counselingcomments.*', 'count(counselingcommentlikes.id) AS counselingcommentlikes')
     #                          .left_joins(:counselingcommentlikes)
     #                          .group('counselingcomments.id')
     #                          .order('counselingcommentlikes desc')
                          # Post.select('posts.*', 'count(favorites.id) AS favs')
                          #     .left_joins(:favorites)
                          #     .group('posts.id')
                          #     .order('favs desc')


#    @CCC = Counselingcommentlike.joins(:counselingcomment).group('counselingcomments.user_id').order(:count).size
    #Counselingcommentlike.joins(:counselingcomment).group("counselingcomments.user_id").each
    # @ddd = Counselingcommentlike.joins(:counselingcomment).group("counselingcomments.user_id").size
    

    # @eee = Counselingcommentlike.joins(:counselingcomment).group("counselingcomments.user_id").count("counselingcommentlikes.id")
    # @fff = Counselingcommentlike.joins(:counselingcomment).group("counselingcomments.user_id").order("counselingcommentlikes.id")
    


puts "===================================================="
    hash = Counselingcommentlike.joins(:counselingcomment).group('counselingcomments.user_id').order('count(counselingcomments.user_id) desc').size
    puts hash
puts "===================================================="
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
