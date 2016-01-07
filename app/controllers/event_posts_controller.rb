class EventPostsController < ApplicationController

  def new
  	@post = current_user.event_posts.new
  end

  def create
  	@post = EventPost.new(event_post_params)
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

  	def event_post_params
  		params.require(:event_post).permit(:event_start_time, :event_end_time, :location, :title, :body)
  	end
end
