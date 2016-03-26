class TextPostsController < ApplicationController
	def new
		@post = current_user.text_posts.new
		@tag_options = Post.tag_options
	end

	def show
    	@post = TextPost.find(params[:id])
  	end

	def create
		@post = current_user.text_posts.new(text_post_params)
		@post.user = current_user
		@post.tag_list.add(params[:tag_list])
		if @post.save
			flash[:notice] = "Post created successfully."
			redirect_to root_path
		else
			flash[:notice] = "Please try posting again."
			redirect_to :back
		end
	end

	private

		def text_post_params
			params.require(:text_post).permit(:title, :body)
		end
end
