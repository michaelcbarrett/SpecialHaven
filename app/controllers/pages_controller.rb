class PagesController < ApplicationController
  def home
  end

  def timeline
  	@posts = Post.all
  	@users = User.all
  	if !user_signed_in? 
  	  redirect_to '/home'
  	end
  end
end
