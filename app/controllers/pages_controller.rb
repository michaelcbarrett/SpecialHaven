class PagesController < ApplicationController
  def home
  end

  def index2
    begin
    @texts = TextPost.all
    @images = ImagePost.all
    @videos = VideoPost.all
    @posts = (@texts + @images).sort_by {|s| s.created_at}
  rescue
    render text: "BLAHFADL"
  end
  end

  def index
    @posts = Post.all
  end

  def timeline
  	@users = User.all
  	if !user_signed_in? 
  	  redirect_to '/home'
  	end

  	if params[:tag]
  		@posts = Post.tagged_with(params[:tag])
  	else
  		@posts = Post.all.sort_by{|p| p.liked_by.length}
  	end

  	if params[:filter]
  		@posts = @posts.select { |post| post.actable_type == "#{params[:filter].capitalize}Post"}
  	end

  	if params[:sort_by]
  		if params[:sort_by] == "recent"
  			@posts = @posts.sort_by{|p| p.created_at}
  		end
  	end
  end
end