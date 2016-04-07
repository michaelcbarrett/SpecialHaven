class UsersController < ApplicationController

	def index
		@users = User.paginate(:page => params[:page], :per_page => 25)
	end

	def show
		@user = User.find(params[:id])
		@activity = (current_user.liked_posts + current_user.posts).sort_by {|s| s.created_at}
	end

	def request_friend
		if current_user.friend_request(User.find(params[:id]))
			flash[:notice] = "Friend request sent successfully."
			redirect_to :back
		else
			flash[:notice] = "Please try adding friend again."
			redirect_to :back
		end
	end

end