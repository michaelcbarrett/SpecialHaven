class ImagePostsController < ApplicationController
  def new
  	@post = current_user.image_posts.new
    @tag_options = Post.tag_options
  end

  def show
    @post = ImagePost.find(params[:id])
  end

  def create
  	@post = current_user.image_posts.new(image_post_params)
		@post.user = current_user
    @post.tag_list.add(params[:tag_list])
		if @post.save
			flash[:notice] = "Post created successfully."
			redirect_to '/timeline'
		else
			flash[:notice] = "Please try posting again. Ensure all fields are filled."
			redirect_to :back
		end
  end

  private

  	def image_post_params
  		params.require(:image_post).permit(:title, :body, :image_url)
  	end
end
