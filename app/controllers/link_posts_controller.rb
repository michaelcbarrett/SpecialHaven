class LinkPostsController < ApplicationController

require 'uri'

  def new
  	@post = current_user.link_posts.new
    @tag_options = Post.tag_options
  end

  def show
    @post = LinkPost.find(params[:id])
  end


  def create
    
    if !!(params[:link_post][:url] =~ URI.regexp)
      url = params[:link_post][:url]
    else
      url = "http://" + params[:link_post][:url]
    end

  	@post = LinkPost.new(link_post_params.merge(url: url))
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

  	def link_post_params
  		params.require(:link_post).permit(:title, :body)
  	end
end
