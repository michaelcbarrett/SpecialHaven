class VideoPostsController < ApplicationController
  def new
  	@post = current_user.video_posts.new
    @tag_options = Post.tag_options
  end

  def show
    @post = VideoPost.find(params[:id])
  end

  def create
  	@post = VideoPost.new(video_post_params)
		@post.user = current_user
    @post.tag_list.add(params[:tag_list])
		if @post.save
			flash[:notice] = "Post created successfully."
			redirect_to root_path
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
