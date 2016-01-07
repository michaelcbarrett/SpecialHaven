class VideoPostsController < ApplicationController
  def new
  	@post = current_user.video_posts.new
  end

  def create
  	@post = VideoPost.new(video_post_params)
		@post.user = current_user
		if @post.save
			flash[:notice] = "Post created successfully."
			redirect_to :back
		else
			flash[:notice] = "Please try posting again. Ensure all fields are filled."
			redirect_to :back
		end
  end

  private

  	def video_post_params
  		params.require(:video_post).permit(:title, :body, :url)
  	end
end
